import '../../common/network/http/http_client.dart';
import '../model/response_model/article_model/article_model.dart';
import '../model/response_model/response_model.dart';

class RemoteDataSource {
  final HttpClient httpClient;

  RemoteDataSource({required this.httpClient});

  //
  // Future<ResponseModel<ArticleModel>> fetchArticle(
  //     {String title = '',
  //       String category = '',
  //       int? page,
  //       String? sortBy,
  //       String? sort}) async {
  //   Map<String, String> qParams = {
  //     'title': title,
  //     'category': category,
  //     'page': page.toString(),
  //     'size': "10",
  //     'sort': "$sortBy,$sort",
  //   };
  //   final response =
  //   await httpClient.get(ServiceUrl.listArticle, queryParameters: qParams);
  //   return ResponseModel.fromJson(response, ArticleModel.fromJson);
  // }

  Future<ResponseModel> fetchArticle(String page,String start, String end) async {
    try {
      Map<String, String> qParams = {
        'page': page,
        'page_size': '20',
        'platforms': '187',
        'dates': '$start,$end',
        'ordering': '-released',
        'key': '02ef6ba5d13444ee86bad607e8bce3f4',

      };
      final response = await httpClient.get(
          "games",queryParameters: qParams);
      var data = ResponseModel.fromJson(response, ArticleModel.fromJson);
      return data;
    } catch (e) {
      return ResponseModel.resultsEmpty();
    }
  }
}
