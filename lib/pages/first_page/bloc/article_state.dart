part of 'article_bloc.dart';

class ArticlePageState extends Equatable with FormzMixin {
  final List<PeopleModel>? listArticle;
  final PeopleModel? articleDetailModel;
  final List<StarshipModel>? listStarship;
  final StarshipModel? starshipDetailModel;
  final List<VehicleModel>? listVehicle;
  final VehicleModel? vehicleDetailModel;
  final PlanetModel? planetModel;
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? type;
  final bool? isSearch;
  final bool isLast;
  final int page;
  final String keyword;
  final String next;

  ArticlePageState( {
    this.listStarship,
    this.starshipDetailModel,
    this.listVehicle,
    this.vehicleDetailModel,
    this.articleDetailModel,
    this.listArticle,
    this.planetModel,
    this.type,
    this.isSearch = false,
    this.submitStatus = FormzStatus.pure,
    this.errorMessage,
    this.isLast = false,
    this.page = 1,
    this.keyword = '',
    this.next = '',
  });

  ArticlePageState copyWith(
      {FormzStatus? submitStatus,
      PeopleModel? articleDetailModel,
      List<StarshipModel>? listStarship,
      StarshipModel? starshipDetailModel,
      List<PeopleModel>? listArticle,
      VehicleModel? vehicleDetailModel,
      List<VehicleModel>? listVehicle,
        PlanetModel? planetModel,
      bool? isSearch,
      String? type,
      bool? isLast,
      int? page,
      String? keyword,
      String? next,
      String? errorMessage}) {
    return ArticlePageState(
        submitStatus: submitStatus,
        articleDetailModel: articleDetailModel ?? this.articleDetailModel,
        starshipDetailModel: starshipDetailModel ?? this.starshipDetailModel,
        vehicleDetailModel: vehicleDetailModel ?? this.vehicleDetailModel,
        planetModel: planetModel ?? this.planetModel,
        listStarship: listStarship ?? this.listStarship,
        listArticle: listArticle ?? this.listArticle,
        listVehicle: listVehicle ?? this.listVehicle,
        isSearch: isSearch ?? this.isSearch,
        type: type,
        isLast: isLast ?? this.isLast,
        page: page ?? this.page,
        keyword: keyword ?? this.keyword,
        next: next ?? this.keyword,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [
        submitStatus ?? '',
        listArticle ?? [],
        listStarship ?? [],
        articleDetailModel ?? PeopleModel(),
        starshipDetailModel ?? StarshipModel(),
        vehicleDetailModel ?? VehicleModel(),
        type ?? '',
        page,
        isLast,
        next
      ];

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();
}

class ArticlePageInitial extends ArticlePageState {}
