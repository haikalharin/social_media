import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:social_media/data/model/people_model/people_model.dart';
import 'package:social_media/data/model/starship_model/starship_model.dart';
import 'package:social_media/data/model/starship_model/starship_temp_model.dart';
import 'package:social_media/data/model/vehicle_model/vehicle_temp_model.dart';

import '../../../common/exceptions/article_error_exception.dart';
import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/exceptions/time_out_exception.dart';
import '../../../data/model/planet_model/planet_model.dart';
import '../../../data/model/post_model/post_model.dart';
import '../../../data/model/response_model/response_model.dart';
import '../../../data/model/vehicle_model/vehicle_model.dart';
import '../../../data/repository/article_repository/article_repository.dart';
import '../../../utils/shared_preference/app_shared_preference.dart';

part 'post_page_event.dart';

part 'post_page_state.dart';

class PostPageBloc extends Bloc<PostPageEvent, PostPageState> {
  PostPageBloc(this.articleRepository) : super(ArticlePageInitial());

  final ArticleRepository articleRepository;

  @override
  Stream<PostPageState> mapEventToState(PostPageEvent event) async* {
    if (event is PostFetchEvent) {
      yield* _mapArticleFetchEventToState(event, state);
    } else if (event is ArticleReadHomeworldEvent) {
      yield* _mapArticleReadHomeworldEventToState(event, state);
    } else if (event is ArticleListStarshipsHorizontalEvent) {
      yield* _mapArticleListStarshipsHorizontalEventToState(event, state);
    } else if (event is ArticleListVehiclesHorizontalEvent) {
      yield* _mapArticleListVehiclesHorizontalEventToState(event, state);
    } else if (event is ArticleBackEvent) {
      yield _mapArticleBackEventToState(event, state);
    }
  }

  PostPageState _mapArticleBackEventToState(
    ArticleBackEvent event,
    PostPageState state,
  ) {
    return state.copyWith(
      isSearch: false,
    );
  }

  Stream<PostPageState> _mapArticleFetchEventToState(
    PostFetchEvent event,
    PostPageState state,
  ) async* {
    if (event.isBottomScroll) {
      yield state.copyWith(
          submitStatus: FormzStatus.submissionInProgress,
          type: 'get-next-page-article');
    } else {
      yield state.copyWith(
          submitStatus: FormzStatus.submissionInProgress,
          type: 'fetching-article');
    }
    try {
      int? page = state.page;
      DateTime dateEnd = DateTime.now();
      DateTime dateStart = dateEnd.subtract(Duration(days: 365));
      bool isLast = false;
      String endString = DateFormat('yyyy-MM-dd').format(dateEnd);
      String startString = DateFormat('yyyy-MM-dd').format(dateStart);
      List<PostModel> data = [];
      String next = '';
      ResponseModel response = ResponseModel.resultsEmpty();

      if (event.page != 0) {
        page = event.page ?? 1;
      }
      if(event.isFromUser){
        response = await articleRepository.fetchPost(
            page,
            startString,
            event.id??'',
            endString,
            event.tag ?? '', event.isFilter ?? false,event.isFromUser);
      }else {
        response = await articleRepository.fetchPost(
            page,
            startString,
            event.id??'',
            endString,
            event.tag ?? '', event.isFilter ?? false,event.isFromUser);
      }

        if (response.data != null) {
          if (state.listArticle != null && event.page != 1) {
            data = state.listArticle ?? [];
            if (event.isSearch == true) {
              response.data.forEach((element) {
                bool isContains = element.text?.contains('${event.keyword}') ?? false;
                if(isContains){
                  data.add(element);
                }
              });
            } else {
              data.addAll(response.data);
            }
          } else {
            if (event.isSearch == true) {
              response.data.forEach((element) {
                bool isContains = element.text?.contains('${event.keyword}') ?? false;
                if(isContains){
                  data.add(element);
                }
              });
            } else {
              data = response.data;
            }
          }
          next = response.next ?? '';
          if (((response.limit ?? 0) * (response.page ?? 1)) <
              (response.total ?? 0)) {
            page = state.page + 1;
          } else {
            page = 1;
            isLast = true;
          }
        }

      yield state.copyWith(
          submitStatus: FormzStatus.submissionSuccess,
          listArticle: data,
          page: page,
          isLast: isLast,
          next: next,
          isFilter:event.isFilter,
          tag: event.tag,
          type: 'fetching-article');
    } on ArticleErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      if (a is NetworkConnectionException) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure,
            errorMessage: "internetConnection");
      } else if (a is TimeoutCustomException) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure,
            errorMessage: "timeout");
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    }
  }

  Stream<PostPageState> _mapArticleListStarshipsHorizontalEventToState(
    ArticleListStarshipsHorizontalEvent event,
    PostPageState state,
  ) async* {
    // yield state.copyWith(
    //     submitStatus: FormzStatus.submissionInProgress,
    //     type: 'fetching-detail');
    // try {
    //   StarshipTempModel starshipTempModel =
    //       await AppSharedPreference.getStarshipModel();
    //
    //   if (event.listData.isNotEmpty) {
    //       List<StarshipModel> listStarship = state.listStarship ?? [];
    //     StarshipModel response =
    //         await articleRepository.readDetailForListStarship(event.id);
    //
    //     if (starshipTempModel.name != state.articleDetailModel?.name ||
    //         (starshipTempModel.name == state.articleDetailModel?.name &&
    //             (listStarship.length >=
    //                 state.articleDetailModel!.starships!.length))) {
    //       listStarship.clear();
    //       AppSharedPreference.setStarshipModel(StarshipTempModel(
    //           name: state.articleDetailModel?.name, listData: listStarship));
    //       listStarship.add(response);
    //     } else {
    //       starshipTempModel.listData?.addAll(listStarship);
    //       listStarship.add(response);
    //       }
    //
    //       if (response.name != null) {
    //         yield state.copyWith(
    //           submitStatus: FormzStatus.submissionSuccess,
    //           listStarship: listStarship,
    //           type: 'fetching-starships',
    //         );
    //       }
    //     } else {
    //       yield state.copyWith(
    //         submitStatus: FormzStatus.submissionSuccess,
    //         listStarship: [],
    //         type: 'fetching-starships',
    //       );
    //     }
    // } on ArticleErrorException catch (e) {
    //   print(e);
    //   yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    // } on Exception catch (a) {
    //   if (a is NetworkConnectionException) {
    //     yield state.copyWith(
    //         submitStatus: FormzStatus.submissionFailure,
    //         errorMessage: "internetConnection");
    //   }else if (a is TimeoutCustomException) {
    //     yield state.copyWith(
    //         submitStatus: FormzStatus.submissionFailure,
    //         errorMessage: "timeout");
    //   } else {
    //     yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    //   }
    // }
  }

  Stream<PostPageState> _mapArticleListVehiclesHorizontalEventToState(
    ArticleListVehiclesHorizontalEvent event,
    PostPageState state,
  ) async* {
    // yield state.copyWith(
    //     submitStatus: FormzStatus.submissionInProgress,
    //     type: 'fetching-detail');
    // try {
    //   VehicleTempModel vehicleTempModel =
    //       await AppSharedPreference.getVehicleipModel();
    //   if (event.listData.isNotEmpty) {
    //     List<VehicleModel> listVehicle = state.listVehicle ?? [];
    //     VehicleModel response =
    //         await articleRepository.readDetailForListVehicle(event.id);
    //
    //     if (vehicleTempModel.name != state.articleDetailModel?.name ||
    //         (vehicleTempModel.name == state.articleDetailModel?.name &&
    //             (listVehicle.length >=
    //                 state.articleDetailModel!.vehicles!.length))) {
    //       listVehicle.clear();
    //       AppSharedPreference.setVehicleModel(VehicleTempModel(
    //           name: state.articleDetailModel?.name, listData: listVehicle));
    //       listVehicle.add(response);
    //     } else {
    //       vehicleTempModel.listData?.addAll(listVehicle);
    //       listVehicle.add(response);
    //     }
    //
    //     if (response.name != null) {
    //       yield state.copyWith(
    //         submitStatus: FormzStatus.submissionSuccess,
    //         listVehicle: listVehicle,
    //         type: 'fetching-vehicle',
    //       );
    //     }
    //   } else {
    //     yield state.copyWith(
    //       submitStatus: FormzStatus.submissionSuccess,
    //       listStarship: [],
    //       type: 'fetching-vehicle',
    //     );
    //   }
    // } on ArticleErrorException catch (e) {
    //   print(e);
    //   yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    // } on Exception catch (a) {
    //   if (a is NetworkConnectionException) {
    //     yield state.copyWith(
    //         submitStatus: FormzStatus.submissionFailure,
    //         errorMessage: "internetConnection");
    //   }else if (a is TimeoutCustomException) {
    //     yield state.copyWith(
    //         submitStatus: FormzStatus.submissionFailure,
    //         errorMessage: "timeout");
    //   }  else {
    //     yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    //   }
    // }
  }
}

Stream<PostPageState> _mapArticleReadHomeworldEventToState(
  ArticleReadHomeworldEvent event,
  PostPageState state,
) async* {
  // yield state.copyWith(
  //     submitStatus: FormzStatus.submissionInProgress,
  //     type: 'fetching-detail');
  // try {
  //   PlanetModel response =
  //   await articleRepository.readDetailHomeworld(event.id);
  //
  //   if (response.name != null) {
  //     yield state.copyWith(
  //       submitStatus: FormzStatus.submissionSuccess,
  //       planetModel: response,
  //       type: 'fetching-homeworld',
  //     );
  //   }
  // } on ArticleErrorException catch (e) {
  //   print(e);
  //   yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
  // } on Exception catch (a) {
  //   if (a is NetworkConnectionException) {
  //     yield state.copyWith(
  //         submitStatus: FormzStatus.submissionFailure,
  //         errorMessage: "internetConnection");
  //   }else if (a is TimeoutCustomException) {
  //     yield state.copyWith(
  //         submitStatus: FormzStatus.submissionFailure,
  //         errorMessage: "timeout");
  //   }  else {
  //     yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
  //   }
  // }
}
//
