import 'package:social_media/common/configurations/configurations.dart';
import 'package:social_media/common/exceptions/time_out_exception.dart';
import 'package:social_media/data/model/post_model/post_model.dart';
import 'package:social_media/data/model/starship_model/starship_model.dart';
import 'package:social_media/data/model/vehicle_model/vehicle_model.dart';

import '../../common/exceptions/network_connection_exception.dart';
import '../../common/network/http/http_client.dart';

import '../model/people_model/people_model.dart';
import '../model/planet_model/planet_model.dart';
import '../model/response_model/response_model.dart';

class RemoteDataSource {
  final HttpClient httpClient;

  RemoteDataSource({required this.httpClient});

  Future<ResponseModel> fetchArticle(String page, String start, String end,
      String keyword, bool isSearch) async {
    try {
      Map<String, String> qParams = {
        'page': page,
        'limit': '20',
      };
      if (isSearch) {
        qParams = {
          'search': keyword,
        };
      }
      final response = await httpClient.get("user", queryParameters: qParams);
      var data = ResponseModel.fromJson(response, PeopleModel.fromJson);

      return data;
    } catch (e) {
      if (e is TimeoutCustomException) {
        return throw e;
      } else {
        return ResponseModel.resultsEmpty();
      }
    }
  }

  Future<ResponseModel> fetchPost(String page, String start, String id, String end,
      String tag, bool isFilter, bool isFromUser) async {
    try {
      Map<String, String> qParams = {};
      String path = 'post';
      if (isFromUser) {
        path = 'user/$id/post';
      }else {
       qParams = {
          'page': page,
          'limit': '20',
        };

        if (isFilter) {
          path = 'tag/$tag/post';
        }
      }

      final response = await httpClient.get(path, queryParameters: qParams);
      var data = ResponseModel.fromJson(response, PostModel.fromJson);

      return data;
    } catch (e) {
      if (e is TimeoutCustomException) {
        return throw e;
      } else {
        return ResponseModel.resultsEmpty();
      }
    }
  }

  Future<PeopleModel> readDetailArticle(String id) async {
    try {
      final response = await httpClient.get("user/$id");
      var data = PeopleModel.fromJson(response);
      return data;
    } catch (e) {
      if (e is TimeoutCustomException) {
        return throw e;
      } else {
        return PeopleModel();
      }
    }
  }

  Future<PlanetModel> readDetailHomeworld(int id) async {
    try {
      Map<String, String> qParams = {
        'key': Configurations.key,
      };
      final response =
          await httpClient.get("planets/$id", queryParameters: qParams);
      var data = PlanetModel.fromJson(response);
      return data;
    } catch (e) {
      if (e is TimeoutCustomException) {
        return throw e;
      } else {
        return PlanetModel();
      }
    }
  }

  Future<StarshipModel> readDetailStarship(int id) async {
    try {
      Map<String, String> qParams = {
        'key': Configurations.key,
      };
      final response =
          await httpClient.get("starships/$id", queryParameters: qParams);
      var data = StarshipModel.fromJson(response);
      return data;
    } catch (e) {
      if (e is TimeoutCustomException) {
        return throw e;
      } else {
        return StarshipModel();
      }
    }
  }

  Future<VehicleModel> readDetailVehicle(int id) async {
    try {
      Map<String, String> qParams = {
        'key': Configurations.key,
      };
      final response =
          await httpClient.get("vehicles/$id", queryParameters: qParams);
      var data = VehicleModel.fromJson(response);
      return data;
    } catch (e) {
      if (e is TimeoutCustomException) {
        return throw e;
      } else {
        return VehicleModel();
      }
    }
  }
}
