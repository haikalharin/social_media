// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_model.freezed.dart';

part 'article_model.g.dart';

ArticleModel articleModelFromJson(String str) =>
    ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

@freezed
class ArticleModel with _$ArticleModel {
  @JsonSerializable(fieldRename: FieldRename.none,includeIfNull: true, explicitToJson: true)
  const factory ArticleModel({
    String? slug,
    String? name,
    int? playtime,
    List<Platform>? platforms,
    List<Store>? stores,
    String? released,
    bool? tba,
    String? backgroundImage,
    double? rating,
    int? ratingTop,
    List<Rating>? ratings,
    int? ratingsCount,
    int? reviewsTextCount,
    int? added,
    AddedByStatus? addedByStatus,
    int? metacritic,
    int? suggestionsCount,
    String? updated,
    int? id,
    dynamic score,
    dynamic clip,
    List<Tag>? tags,
    EsrbRating? esrbRating,
    dynamic userGame,
    int? reviewsCount,
    String? saturatedColor,
    String? dominantColor,
    List<ShortScreenshot>? shortScreenshots,
    List<Platform>? parentPlatforms,
    List<Genre>? genres,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}

@freezed
class AddedByStatus with _$AddedByStatus {
  const factory AddedByStatus({
     int? yet,
     int? owned,
     int? beaten,
     int? toplay,
     int? dropped,
     int? playing,
  }) = _AddedByStatus;
  factory AddedByStatus.fromJson(Map<String, dynamic> json) =>
      _$AddedByStatusFromJson(json);
}

@freezed
class EsrbRating with _$EsrbRating {
  const factory EsrbRating({
     int? id,
     String? name,
     String? slug,
     String? nameEn,
     String? nameRu,
  }) = _EsrbRating;

  factory EsrbRating.fromJson(Map<String, dynamic> json) =>
      _$EsrbRatingFromJson(json);
}


@freezed
class Genre with _$Genre {
  const factory Genre({
     int? id,
     String? name,
     String? slug,
  }) = _Genre;
  factory Genre.fromJson(Map<String, dynamic> json) =>
      _$GenreFromJson(json);
}

@freezed
class Platform with _$Platform {
  const factory Platform({
     Genre? platform,
  }) = _Platform;
  factory Platform.fromJson(Map<String, dynamic> json) =>
      _$PlatformFromJson(json);
}

@freezed
class Rating with _$Rating {
  const factory Rating({
     int? id,
     String? title,
     int? count,
     double? percent,
  }) = _Rating;
  factory Rating.fromJson(Map<String, dynamic> json) =>
      _$RatingFromJson(json);
}

@freezed
class ShortScreenshot with _$ShortScreenshot {
  const factory ShortScreenshot({
     int? id,
     String? image,
  }) = _ShortScreenshot;
  factory ShortScreenshot.fromJson(Map<String, dynamic> json) =>
      _$ShortScreenshotFromJson(json);
}

@freezed
class Store with _$Store {
  const factory Store({
     Genre? store,
  }) = _Store;
  factory Store.fromJson(Map<String, dynamic> json) =>
      _$StoreFromJson(json);
}

@freezed
class Tag with _$Tag {
  const factory Tag({
     int? id,
     String? name,
     String? slug,
     String? language,
     int? gamesCount,
     String? imageBackground,
  }) = _Tag;
  factory Tag.fromJson(Map<String, dynamic> json) =>
      _$TagFromJson(json);
}

