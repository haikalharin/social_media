import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mockito/mockito.dart';
import 'package:social_media/data/model/people_model/people_model.dart';
import 'package:social_media/data/model/response_model/response_model.dart';
import 'package:social_media/data/model/starship_model/starship_model.dart';
import 'package:social_media/data/repository/article_repository/article_repository.dart';
import 'package:social_media/pages/user_page/bloc/user_page_bloc.dart';

var dataException = null;

var dataArticle = PeopleModel(firstName: "Han solo", gender: "male");
var listData = ResponseModel(
    count: 237,
    next:
        "https://api.rawg.io/api/games?dates=2020-12-21%2C2021-12-21&key=02ef6ba5d13444ee86bad607e8bce3f4&ordering=-released&page=2&page_size=20&platforms=187",
    data: [dataArticle, dataArticle, dataArticle]);
var dataDetail = PeopleModel(firstName: "Han solo", gender: "male");

var starshipDetail = StarshipModel(name: "plane", model: "plane");

var dataMap = {
  "id": 437049,
  "slug": "fifa-21",
  "name": "FIFA 21",
  "name_original": "FIFA 21",
};

class ArticleMockRepository extends Mock implements ArticleRepository {
  @override
  Future<PeopleModel> readDetailArticle(String id) async {
    return dataDetail;
  }

  @override
  Future<ResponseModel> fetchArticle(int page, String start, String end,String keyword,bool isSearch) async {
    return listData;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('check_Article_bloc', () {
    ArticleMockRepository? repository;
    UserPageBloc bloc = UserPageBloc(ArticleMockRepository());
    UserPageState state = UserPageState();
    List<PeopleModel>listDetail = [];
    List<StarshipModel>?listStarships = [];
    var id = '437049',
        submitStatusInProgress,
        submitStatusSuccess,
        type,
        page = 0,
        isLast,
        next,
        starshipsDetail,
        articleDetail;
    setUp(() async {
      // var prefs = await SharedPreferences.getInstance()
      repository = ArticleMockRepository();
      bloc = UserPageBloc(repository ?? ArticleMockRepository());
    });

    blocTest("_mapArticleFetchEventToState",
        wait: const Duration(seconds: 5),
        build: () {
          submitStatusInProgress = FormzStatus.submissionInProgress;
          submitStatusSuccess = FormzStatus.submissionSuccess;
          type = 'fetching-article';
          page = 2;
          isLast = false;
          next =
          "https://api.rawg.io/api/games?dates=2020-12-21%2C2021-12-21&key=02ef6ba5d13444ee86bad607e8bce3f4&ordering=-released&page=2&page_size=20&platforms=187";
          listDetail = listData.data;

          return bloc;
        },
        act: (bloc) {
          dynamic data = bloc;
          data.add(ArticleFetchEvent(page: 1, isBottomScroll: false));
        },
        expect: () =>
        [
          state.copyWith(submitStatus: submitStatusInProgress, type: type),
          state.copyWith(
              submitStatus: submitStatusSuccess,
              listArticle: listDetail,
              page: page,
              isLast: isLast,
              next: next,
              type: type)
        ]);

    blocTest("_mapArticleReadEventToState",
        wait: const Duration(seconds: 5),
        build: () {
          submitStatusInProgress = FormzStatus.submissionInProgress;
          submitStatusSuccess = FormzStatus.submissionSuccess;
          type = 'fetching-detail';
          articleDetail = dataDetail;
          return bloc;
        },
        act: (bloc) {
          dynamic data = bloc;
          data.add(ArticleReadDetailEvent(id));
        },
        expect: () => [
              state.copyWith(submitStatus: submitStatusInProgress, type: type),
              state.copyWith(
                  submitStatus: submitStatusSuccess,
                  articleDetailModel: articleDetail,
                  type: type)
            ]);
  });
}
