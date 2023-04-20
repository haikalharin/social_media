
import '../../model/article_detail_model/article_detail_model.dart';
import '../../model/response_model/response_model.dart';

abstract class ArticleRepository {
  Future<ResponseModel> fetchArticle(int page,String start, String end);

  Future<ArticleDetailModel> readDetailArticle(int id);
}
