
import 'package:swapi/data/model/people_model/people_model.dart';

import '../../model/article_detail_model/article_detail_model.dart';
import '../../model/response_model/response_model.dart';
import '../../model/starship_model/starship_model.dart';

abstract class ArticleRepository {
  Future<ResponseModel> fetchArticle(int page,String start, String end,String keyword,bool isSearch);

  Future<PeopleModel> readDetailArticle(int id);
  Future<StarshipModel> readDetailForListStarship(String type, int id);
}
