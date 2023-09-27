import 'package:swapi/common/configurations/configurations.dart';
import 'package:swapi/common/exceptions/time_out_exception.dart';
import 'package:swapi/data/model/starship_model/starship_model.dart';
import 'package:swapi/data/model/vehicle_model/vehicle_model.dart';

import '../../common/exceptions/network_connection_exception.dart';
import '../../common/network/http/http_client.dart';

import '../model/people_model/people_model.dart';
import '../model/planet_model/planet_model.dart';
import '../model/response_model/response_model.dart';

class RemoteDataSource {
  final HttpClient httpClient;

  RemoteDataSource({required this.httpClient});




  Future<ResponseModel> fetchArticle(String page,String start, String end,String keyword, bool isSearch) async {
    try {
      Map<String, String> qParams = {
        'page': page,
      };
      if(isSearch) {
        qParams = {
          'search': keyword,
        };
      }

      final response = await httpClient.get(
          "people",queryParameters: qParams);
      var data = ResponseModel.fromJson(response, PeopleModel.fromJson);
      return data;
    } catch (e) {
      if (e is TimeoutCustomException) {
        return throw e;
      }else {
        return ResponseModel.resultsEmpty();
      }
    }
  }

  Future<PeopleModel> readDetailArticle(int id) async {
    try {
      Map<String, String> qParams = {
        'key': Configurations.key,
      };
      final response = await httpClient.get(
          "people/$id",queryParameters: qParams);
      var data = PeopleModel.fromJson(response);
      return data;
    } catch (e) {
      if (e is TimeoutCustomException) {
        return throw e;
      }else {
        return PeopleModel();
      }
    }
  }

  Future<PlanetModel> readDetailHomeworld(int id) async {
    try {
      Map<String, String> qParams = {
        'key': Configurations.key,
      };
      final response = await httpClient.get(
          "planets/$id",queryParameters: qParams);
      var data = PlanetModel.fromJson(response);
      return data;
    } catch (e) {
      if (e is TimeoutCustomException) {
        return throw e;
      }else {
        return PlanetModel();
      }
    }
  }

  Future<StarshipModel> readDetailStarship(int id) async {
    try {
      Map<String, String> qParams = {
        'key': Configurations.key,
      };
      final response = await httpClient.get(
          "starships/$id",queryParameters: qParams);
      var data = StarshipModel.fromJson(response);
      return data;
    } catch (e) {
      if (e is TimeoutCustomException) {
        return throw e;
      }else {
        return StarshipModel();
      }
    }
  }

  Future<VehicleModel> readDetailVehicle(int id) async {
    try {
      Map<String, String> qParams = {
        'key': Configurations.key,
      };
      final response = await httpClient.get(
          "vehicles/$id",queryParameters: qParams);
      var data = VehicleModel.fromJson(response);
      return data;
    } catch (e) {
      if (e is TimeoutCustomException) {
        return throw e;
      }else {
        return VehicleModel();
      }
    }
  }
}
