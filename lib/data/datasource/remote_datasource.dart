import 'package:base_app_new/common/configurations/configurations.dart';

import '../../common/network/http/http_client.dart';
import '../model/article_detail_model/article_detail_model.dart';
import '../model/article_model/article_model.dart';
import '../model/response_model/response_model.dart';

class RemoteDataSource {
  final HttpClient httpClient;

  RemoteDataSource({required this.httpClient});




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

  Future<ArticleDetailModel> readDetailArticle(int id) async {
    try {
      Map<String, String> qParams = {
        'key': Configurations.key,
      };
      final response = await httpClient.get(
          "games/$id",queryParameters: qParams);
      var data = ArticleDetailModel.fromJson(response);
      return data;
    } catch (e) {
      return ArticleDetailModel();
    }
  }
}
