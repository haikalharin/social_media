
import 'package:swapi/data/model/people_model/people_model.dart';

import '../../model/planet_model/planet_model.dart';
import '../../model/response_model/response_model.dart';
import '../../model/starship_model/starship_model.dart';
import '../../model/vehicle_model/vehicle_model.dart';

abstract class ArticleRepository {
  Future<ResponseModel> fetchArticle(int page,String start, String end,String keyword,bool isSearch);

  Future<PeopleModel> readDetailArticle(int id);
  Future<PlanetModel> readDetailHomeworld(int id);
  Future<StarshipModel> readDetailForListStarship( int id);
  Future<VehicleModel> readDetailForListVehicle( int id);
}
