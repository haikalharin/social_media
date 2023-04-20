// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticleModel _$$_ArticleModelFromJson(Map<String, dynamic> json) =>
    _$_ArticleModel(
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      playtime: json['playtime'] as int?,
      platforms: (json['platforms'] as List<dynamic>?)
          ?.map((e) => Platform.fromJson(e as Map<String, dynamic>))
          .toList(),
      stores: (json['stores'] as List<dynamic>?)
          ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
      released: json['released'] as String?,
      tba: json['tba'] as bool?,
      backgroundImage: json['backgroundImage'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingTop: json['ratingTop'] as int?,
      ratings: (json['ratings'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratingsCount: json['ratingsCount'] as int?,
      reviewsTextCount: json['reviewsTextCount'] as int?,
      added: json['added'] as int?,
      addedByStatus: json['addedByStatus'] == null
          ? null
          : AddedByStatus.fromJson(
              json['addedByStatus'] as Map<String, dynamic>),
      metacritic: json['metacritic'] as int?,
      suggestionsCount: json['suggestionsCount'] as int?,
      updated: json['updated'] as String?,
      id: json['id'] as int?,
      score: json['score'],
      clip: json['clip'],
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      esrbRating: json['esrbRating'] == null
          ? null
          : EsrbRating.fromJson(json['esrbRating'] as Map<String, dynamic>),
      userGame: json['userGame'],
      reviewsCount: json['reviewsCount'] as int?,
      saturatedColor: json['saturatedColor'] as String?,
      dominantColor: json['dominantColor'] as String?,
      shortScreenshots: (json['shortScreenshots'] as List<dynamic>?)
          ?.map((e) => ShortScreenshot.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentPlatforms: (json['parentPlatforms'] as List<dynamic>?)
          ?.map((e) => Platform.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ArticleModelToJson(_$_ArticleModel instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'playtime': instance.playtime,
      'platforms': instance.platforms?.map((e) => e.toJson()).toList(),
      'stores': instance.stores?.map((e) => e.toJson()).toList(),
      'released': instance.released,
      'tba': instance.tba,
      'backgroundImage': instance.backgroundImage,
      'rating': instance.rating,
      'ratingTop': instance.ratingTop,
      'ratings': instance.ratings?.map((e) => e.toJson()).toList(),
      'ratingsCount': instance.ratingsCount,
      'reviewsTextCount': instance.reviewsTextCount,
      'added': instance.added,
      'addedByStatus': instance.addedByStatus?.toJson(),
      'metacritic': instance.metacritic,
      'suggestionsCount': instance.suggestionsCount,
      'updated': instance.updated,
      'id': instance.id,
      'score': instance.score,
      'clip': instance.clip,
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
      'esrbRating': instance.esrbRating?.toJson(),
      'userGame': instance.userGame,
      'reviewsCount': instance.reviewsCount,
      'saturatedColor': instance.saturatedColor,
      'dominantColor': instance.dominantColor,
      'shortScreenshots':
          instance.shortScreenshots?.map((e) => e.toJson()).toList(),
      'parentPlatforms':
          instance.parentPlatforms?.map((e) => e.toJson()).toList(),
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
    };

_$_AddedByStatus _$$_AddedByStatusFromJson(Map<String, dynamic> json) =>
    _$_AddedByStatus(
      yet: json['yet'] as int?,
      owned: json['owned'] as int?,
      beaten: json['beaten'] as int?,
      toplay: json['toplay'] as int?,
      dropped: json['dropped'] as int?,
      playing: json['playing'] as int?,
    );

Map<String, dynamic> _$$_AddedByStatusToJson(_$_AddedByStatus instance) =>
    <String, dynamic>{
      'yet': instance.yet,
      'owned': instance.owned,
      'beaten': instance.beaten,
      'toplay': instance.toplay,
      'dropped': instance.dropped,
      'playing': instance.playing,
    };

_$_EsrbRating _$$_EsrbRatingFromJson(Map<String, dynamic> json) =>
    _$_EsrbRating(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      nameEn: json['nameEn'] as String?,
      nameRu: json['nameRu'] as String?,
    );

Map<String, dynamic> _$$_EsrbRatingToJson(_$_EsrbRating instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'nameEn': instance.nameEn,
      'nameRu': instance.nameRu,
    };

_$_Genre _$$_GenreFromJson(Map<String, dynamic> json) => _$_Genre(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$$_GenreToJson(_$_Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

_$_Platform _$$_PlatformFromJson(Map<String, dynamic> json) => _$_Platform(
      platform: json['platform'] == null
          ? null
          : Genre.fromJson(json['platform'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PlatformToJson(_$_Platform instance) =>
    <String, dynamic>{
      'platform': instance.platform,
    };

_$_Rating _$$_RatingFromJson(Map<String, dynamic> json) => _$_Rating(
      id: json['id'] as int?,
      title: json['title'] as String?,
      count: json['count'] as int?,
      percent: (json['percent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_RatingToJson(_$_Rating instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'count': instance.count,
      'percent': instance.percent,
    };

_$_ShortScreenshot _$$_ShortScreenshotFromJson(Map<String, dynamic> json) =>
    _$_ShortScreenshot(
      id: json['id'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_ShortScreenshotToJson(_$_ShortScreenshot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };

_$_Store _$$_StoreFromJson(Map<String, dynamic> json) => _$_Store(
      store: json['store'] == null
          ? null
          : Genre.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'store': instance.store,
    };

_$_Tag _$$_TagFromJson(Map<String, dynamic> json) => _$_Tag(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      language: json['language'] as String?,
      gamesCount: json['gamesCount'] as int?,
      imageBackground: json['imageBackground'] as String?,
    );

Map<String, dynamic> _$$_TagToJson(_$_Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'language': instance.language,
      'gamesCount': instance.gamesCount,
      'imageBackground': instance.imageBackground,
    };
