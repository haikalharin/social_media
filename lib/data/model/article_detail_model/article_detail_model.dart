// To parse this JSON data, do
//
//     final articleDetailModel = articleDetailModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'article_detail_model.freezed.dart';
part 'article_detail_model.g.dart';

ArticleDetailModel articleDetailModelFromJson(String str) => ArticleDetailModel.fromJson(json.decode(str));

String articleDetailModelToJson(ArticleDetailModel data) => json.encode(data.toJson());

@freezed
class ArticleDetailModel with _$ArticleDetailModel {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory ArticleDetailModel({
    int? id,
    String? slug,
    String? name,
    String? nameOriginal,
    String? description,
    int? metacritic,
    List<MetacriticPlatform>? metacriticPlatforms,
    String? released,
    bool? tba,
    String? updated,
    String? backgroundImage,
    String? backgroundImageAdditional,
    String? website,
    double? rating,
    int? ratingTop,
    List<Rating>? ratings,
    Reactions? reactions,
    int? added,
    AddedByStatus? addedByStatus,
    int? playtime,
    int? screenshotsCount,
    int? moviesCount,
    int? creatorsCount,
    int? achievementsCount,
    int? parentAchievementsCount,
    String? redditUrl,
    String? redditName,
    String? redditDescription,
    String? redditLogo,
    int? redditCount,
    int? twitchCount,
    int? youtubeCount,
    int? reviewsTextCount,
    int? ratingsCount,
    int? suggestionsCount,
    List<dynamic>? alternativeNames,
    String? metacriticUrl,
    int? parentsCount,
    int? additionsCount,
    int? gameSeriesCount,
   dynamic userGame,
    int? reviewsCount,
    String? saturatedColor,
    String? dominantColor,
    List<ParentPlatform>? parentPlatforms,
    List<PlatformElement>? platforms,
    List<Store>? stores,
    List<Developer>? developers,
    List<Developer>? genres,
    List<Developer>? tags,
    List<Developer>? publishers,
   dynamic esrbRating,
   dynamic clip,
    String? descriptionRaw,
  }) = _ArticleDetailModel;

  factory ArticleDetailModel.fromJson(Map<String, dynamic> json) => _$ArticleDetailModelFromJson(json);
}

@freezed
class AddedByStatus with _$AddedByStatus {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory AddedByStatus({
    int? yet,
    int? owned,
    int? beaten,
    int? toplay,
    int? dropped,
    int? playing,
  }) = _AddedByStatus;

  factory AddedByStatus.fromJson(Map<String, dynamic> json) => _$AddedByStatusFromJson(json);
}

@freezed
class Developer with _$Developer {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory Developer({
    int? id,
    String? name,
    String? slug,
    int? gamesCount,
    String? imageBackground,
    String? domain,
    String? language,
  }) = _Developer;

  factory Developer.fromJson(Map<String, dynamic> json) => _$DeveloperFromJson(json);
}

@freezed
class MetacriticPlatform with _$MetacriticPlatform {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory MetacriticPlatform({
    int? metascore,
    String? url,
    MetacriticPlatformPlatform? platform,
  }) = _MetacriticPlatform;

  factory MetacriticPlatform.fromJson(Map<String, dynamic> json) => _$MetacriticPlatformFromJson(json);
}

@freezed
class MetacriticPlatformPlatform with _$MetacriticPlatformPlatform {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory MetacriticPlatformPlatform({
    int? platform,
    String? name,
    String? slug,
  }) = _MetacriticPlatformPlatform;

  factory MetacriticPlatformPlatform.fromJson(Map<String, dynamic> json) => _$MetacriticPlatformPlatformFromJson(json);
}

@freezed
class ParentPlatform with _$ParentPlatform {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory ParentPlatform({
    ParentPlatformPlatform? platform,
  }) = _ParentPlatform;

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => _$ParentPlatformFromJson(json);
}

@freezed
class ParentPlatformPlatform with _$ParentPlatformPlatform {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory ParentPlatformPlatform({
    int? id,
    String? name,
    String? slug,
  }) = _ParentPlatformPlatform;

  factory ParentPlatformPlatform.fromJson(Map<String, dynamic> json) => _$ParentPlatformPlatformFromJson(json);
}

@freezed
class PlatformElement with _$PlatformElement {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory PlatformElement({
    PlatformPlatform? platform,
    String? releasedAt,
    Requirements? requirements,
  }) = _PlatformElement;

  factory PlatformElement.fromJson(Map<String, dynamic> json) => _$PlatformElementFromJson(json);
}

@freezed
class PlatformPlatform with _$PlatformPlatform {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory PlatformPlatform({
    int? id,
    String? name,
    String? slug,
   dynamic image,
   dynamic yearEnd,
    int? yearStart,
    int? gamesCount,
    String? imageBackground,
  }) = _PlatformPlatform;

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) => _$PlatformPlatformFromJson(json);
}

@freezed
class Requirements with _$Requirements {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory Requirements({
    String? minimum,
    String? recommended,
  }) = _Requirements;

  factory Requirements.fromJson(Map<String, dynamic> json) => _$RequirementsFromJson(json);
}

@freezed
class Rating with _$Rating {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory Rating({
    int? id,
    String? title,
    int? count,
    double? percent,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}

@freezed
class Reactions with _$Reactions {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory Reactions() = _Reactions;

  factory Reactions.fromJson(Map<String, dynamic> json) => _$ReactionsFromJson(json);
}

@freezed
class Store with _$Store {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory Store({
    int? id,
    String? url,
    Developer? store,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
