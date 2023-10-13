import 'package:social_media/data/model/planet_model/planet_model.dart';
import 'package:social_media/data/model/starship_model/starship_model.dart';

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../datasource/remote_datasource.dart';
import '../../model/people_model/people_model.dart';
import '../../model/response_model/response_model.dart';
import '../../model/vehicle_model/vehicle_model.dart';
import 'article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final RemoteDataSource remoteDatasource;
  final NetworkInfoImpl networkInfo;

  ArticleRepositoryImpl(this.remoteDatasource, this.networkInfo);

  @override
  Future<ResponseModel> fetchArticle(
      int page, String start, String end, String keyword, bool isSearch) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchArticle(
          page.toString(), start, end, keyword, isSearch);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> fetchPost(int page, String start, String id, String end,
      String tag, bool isFilter, bool isFromUser) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchPost(
          page.toString(), start, id, end, tag, isFilter, isFromUser);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<PeopleModel> readDetailArticle(String id) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.readDetailArticle(id);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<PlanetModel> readDetailHomeworld(int id) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.readDetailHomeworld(id);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<StarshipModel> readDetailForListStarship(int id) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.readDetailStarship(id);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<VehicleModel> readDetailForListVehicle(int id) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.readDetailVehicle(id);
    }
    throw NetworkConnectionException();
  }
}
