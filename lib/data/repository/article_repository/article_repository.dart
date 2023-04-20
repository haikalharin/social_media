
import '../../model/response_model/response_model.dart';

abstract class ArticleRepository {
  Future<ResponseModel> fetchArticle(int page, String sort, String sortBy,
      { String title = '', String category = ''});

  Future<ResponseModel> readArticle(String id);
}
