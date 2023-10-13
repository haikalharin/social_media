import 'package:social_media/data/model/people_model/people_model.dart';

import '../../model/planet_model/planet_model.dart';
import '../../model/response_model/response_model.dart';
import '../../model/starship_model/starship_model.dart';
import '../../model/vehicle_model/vehicle_model.dart';

abstract class ArticleRepository {
  Future<ResponseModel> fetchArticle(
      int page, String start, String end, String keyword, bool isSearch);

  Future<ResponseModel> fetchPost(int page, String start, String id, String end,
      String tag, bool isFilter, bool isFromUser);

  Future<PeopleModel> readDetailArticle(String id);

  Future<PlanetModel> readDetailHomeworld(int id);

  Future<StarshipModel> readDetailForListStarship(int id);

  Future<VehicleModel> readDetailForListVehicle(int id);
}
