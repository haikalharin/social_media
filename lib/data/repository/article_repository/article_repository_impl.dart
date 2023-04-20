

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../datasource/remote_datasource.dart';

import '../../model/response_model/response_model.dart';
import 'article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDatasource;

  ArticleRepositoryImpl(this.networkInfo, this.remoteDatasource);

  @override
  Future<ResponseModel> fetchArticle(
      int page, String sort, String sortBy,
      { String title = '', String category = ''}) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchArticle('');
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> readArticle(String id) async {
    // if (await networkInfo.isConnected) {
    //   return remoteDatasource.readArticle(id);
    // }
    throw NetworkConnectionException();
  }

}
