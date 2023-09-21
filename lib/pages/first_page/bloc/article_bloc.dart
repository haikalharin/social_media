import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:swapi/data/model/people_model/people_model.dart';
import 'package:swapi/data/model/starship_model/starship_model.dart';
import 'package:swapi/data/model/starship_model/starship_temp_model.dart';

import '../../../common/exceptions/article_error_exception.dart';
import '../../../data/model/article_detail_model/article_detail_model.dart';
import '../../../data/model/response_model/response_model.dart';
import '../../../data/repository/article_repository/article_repository.dart';
import '../../../utils/shared_preference/app_shared_preference.dart';

part 'article_event.dart';

part 'article_state.dart';

class ArticlePageBloc extends Bloc<ArticlePageEvent, ArticlePageState> {
  ArticlePageBloc(this.articleRepository) : super(ArticlePageInitial());

  final ArticleRepository articleRepository;

  @override
  Stream<ArticlePageState> mapEventToState(ArticlePageEvent event) async* {
    if (event is ArticleFetchEvent) {
      yield* _mapArticleFetchEventToState(event, state);
    } else if (event is ArticleReadDetailEvent) {
      yield* _mapArticleReadEventToState(event, state);
    } else if (event is ArticleListStarshipsHorizontalEvent) {
      yield* _mapArticleListStarshipsHorizontalEventToState(event, state);
    } else if (event is ArticleBackEvent) {
      yield _mapArticleBackEventToState(event, state);
    }
  }

  ArticlePageState _mapArticleBackEventToState(
    ArticleBackEvent event,
    ArticlePageState state,
  ) {
    return state.copyWith(
      isSearch: false,
    );
  }

  Stream<ArticlePageState> _mapArticleFetchEventToState(
    ArticleFetchEvent event,
    ArticlePageState state,
  ) async* {
    if(event.isBottomScroll){
      yield state.copyWith(
          submitStatus: FormzStatus.submissionInProgress,
          type: 'get-next-page-article');
    }else {
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

      if (event.page != 0) {
        page = event.page ?? 1;
      }


      ResponseModel response = await articleRepository.fetchArticle(
          page, startString, endString,event.keyword??'', event.isSearch??false);
      List<PeopleModel>data = [];
      String next = '';

      if (response.results != null) {
        if (state.listArticle != null && event.page != 1) {
          data = state.listArticle??[];
          data.addAll(response.results);
        } else {
          data = response.results;
        }
        next = response.next??'';
        if (response.next != null) {
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
          type: 'fetching-article');
    } on ArticleErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {}
  }

  Stream<ArticlePageState> _mapArticleListStarshipsHorizontalEventToState(
      ArticleListStarshipsHorizontalEvent event,
    ArticlePageState state,
  ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress,
        type: 'fetching-detail');
    try {
      StarshipTempModel starshipTempModel =
          await AppSharedPreference.getStarshipModel();
      if (event.type == 'starships') {
        if (event.listData.isNotEmpty) {
          List<StarshipModel> listStarship = state.listStarship ?? [];
          StarshipModel response = await articleRepository
              .readDetailForListStarship(event.type, event.id);

          if (starshipTempModel.name != state.articleDetailModel?.name ||
              (starshipTempModel.name == state.articleDetailModel?.name  &&
                  (listStarship.length  >= state.articleDetailModel!.starships!.length))) {
            listStarship.clear();
            AppSharedPreference.setStarshipModel(
                StarshipTempModel(name: state.articleDetailModel?.name, listData: listStarship));
            listStarship.add(response);
          } else {
            starshipTempModel.listData?.addAll(listStarship);
            listStarship.add(response);
          }

          if (response.name != null) {
            yield state.copyWith(
              submitStatus: FormzStatus.submissionSuccess,
              listStarship: listStarship,
              type: 'fetching-starships',
            );
          }
        } else {
          yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            listStarship: [],
            type: 'fetching-starships',
          );
        }
      } else {
        yield state.copyWith(
          submitStatus: FormzStatus.submissionFailure,
          listStarship: [],
          type: 'fetching-starships',
        );
      }
    } on ArticleErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {}
  }

  Stream<ArticlePageState> _mapArticleReadEventToState(
    ArticleReadDetailEvent event,
    ArticlePageState state,
  ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress,
        type: 'fetching-detail');
    try {
      PeopleModel response =
          await articleRepository.readDetailArticle(event.id);

      if (response.name != null) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            articleDetailModel: response,
          type: 'fetching-detail',);
      }

    } on ArticleErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {}
  }
//

}
