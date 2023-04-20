
import '../../model/response_model/response_model.dart';

abstract class ArticleRepository {
  Future<ResponseModel> fetchArticle(int page,String start, String end);

  Future<ResponseModel> readArticle(String id);
}
