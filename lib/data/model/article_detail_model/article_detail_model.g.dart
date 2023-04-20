// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticleDetailModel _$$_ArticleDetailModelFromJson(
        Map<String, dynamic> json) =>
    _$_ArticleDetailModel(
      id: json['id'] as int?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      nameOriginal: json['name_original'] as String?,
      description: json['description'] as String?,
      metacritic: json['metacritic'] as int?,
      metacriticPlatforms: (json['metacritic_platforms'] as List<dynamic>?)
          ?.map((e) => MetacriticPlatform.fromJson(e as Map<String, dynamic>))
          .toList(),
      released: json['released'] as String?,
      tba: json['tba'] as bool?,
      updated: json['updated'] as String?,
      backgroundImage: json['background_image'] as String?,
      backgroundImageAdditional: json['background_image_additional'] as String?,
      website: json['website'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingTop: json['rating_top'] as int?,
      ratings: (json['ratings'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
      reactions: json['reactions'] == null
          ? null
          : Reactions.fromJson(json['reactions'] as Map<String, dynamic>),
      added: json['added'] as int?,
      addedByStatus: json['added_by_status'] == null
          ? null
          : AddedByStatus.fromJson(
              json['added_by_status'] as Map<String, dynamic>),
      playtime: json['playtime'] as int?,
      screenshotsCount: json['screenshots_count'] as int?,
      moviesCount: json['movies_count'] as int?,
      creatorsCount: json['creators_count'] as int?,
      achievementsCount: json['achievements_count'] as int?,
      parentAchievementsCount: json['parent_achievements_count'] as int?,
      redditUrl: json['reddit_url'] as String?,
      redditName: json['reddit_name'] as String?,
      redditDescription: json['reddit_description'] as String?,
      redditLogo: json['reddit_logo'] as String?,
      redditCount: json['reddit_count'] as int?,
      twitchCount: json['twitch_count'] as int?,
      youtubeCount: json['youtube_count'] as int?,
      reviewsTextCount: json['reviews_text_count'] as int?,
      ratingsCount: json['ratings_count'] as int?,
      suggestionsCount: json['suggestions_count'] as int?,
      alternativeNames: json['alternative_names'] as List<dynamic>?,
      metacriticUrl: json['metacritic_url'] as String?,
      parentsCount: json['parents_count'] as int?,
      additionsCount: json['additions_count'] as int?,
      gameSeriesCount: json['game_series_count'] as int?,
      userGame: json['user_game'],
      reviewsCount: json['reviews_count'] as int?,
      saturatedColor: json['saturated_color'] as String?,
      dominantColor: json['dominant_color'] as String?,
      parentPlatforms: (json['parent_platforms'] as List<dynamic>?)
          ?.map((e) => ParentPlatform.fromJson(e as Map<String, dynamic>))
          .toList(),
      platforms: (json['platforms'] as List<dynamic>?)
          ?.map((e) => PlatformElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      stores: (json['stores'] as List<dynamic>?)
          ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
      developers: (json['developers'] as List<dynamic>?)
          ?.map((e) => Developer.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Developer.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Developer.fromJson(e as Map<String, dynamic>))
          .toList(),
      publishers: (json['publishers'] as List<dynamic>?)
          ?.map((e) => Developer.fromJson(e as Map<String, dynamic>))
          .toList(),
      esrbRating: json['esrb_rating'],
      clip: json['clip'],
      descriptionRaw: json['description_raw'] as String?,
    );

Map<String, dynamic> _$$_ArticleDetailModelToJson(
        _$_ArticleDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'name_original': instance.nameOriginal,
      'description': instance.description,
      'metacritic': instance.metacritic,
      'metacritic_platforms':
          instance.metacriticPlatforms?.map((e) => e.toJson()).toList(),
      'released': instance.released,
      'tba': instance.tba,
      'updated': instance.updated,
      'background_image': instance.backgroundImage,
      'background_image_additional': instance.backgroundImageAdditional,
      'website': instance.website,
      'rating': instance.rating,
      'rating_top': instance.ratingTop,
      'ratings': instance.ratings?.map((e) => e.toJson()).toList(),
      'reactions': instance.reactions?.toJson(),
      'added': instance.added,
      'added_by_status': instance.addedByStatus?.toJson(),
      'playtime': instance.playtime,
      'screenshots_count': instance.screenshotsCount,
      'movies_count': instance.moviesCount,
      'creators_count': instance.creatorsCount,
      'achievements_count': instance.achievementsCount,
      'parent_achievements_count': instance.parentAchievementsCount,
      'reddit_url': instance.redditUrl,
      'reddit_name': instance.redditName,
      'reddit_description': instance.redditDescription,
      'reddit_logo': instance.redditLogo,
      'reddit_count': instance.redditCount,
      'twitch_count': instance.twitchCount,
      'youtube_count': instance.youtubeCount,
      'reviews_text_count': instance.reviewsTextCount,
      'ratings_count': instance.ratingsCount,
      'suggestions_count': instance.suggestionsCount,
      'alternative_names': instance.alternativeNames,
      'metacritic_url': instance.metacriticUrl,
      'parents_count': instance.parentsCount,
      'additions_count': instance.additionsCount,
      'game_series_count': instance.gameSeriesCount,
      'user_game': instance.userGame,
      'reviews_count': instance.reviewsCount,
      'saturated_color': instance.saturatedColor,
      'dominant_color': instance.dominantColor,
      'parent_platforms':
          instance.parentPlatforms?.map((e) => e.toJson()).toList(),
      'platforms': instance.platforms?.map((e) => e.toJson()).toList(),
      'stores': instance.stores?.map((e) => e.toJson()).toList(),
      'developers': instance.developers?.map((e) => e.toJson()).toList(),
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
      'publishers': instance.publishers?.map((e) => e.toJson()).toList(),
      'esrb_rating': instance.esrbRating,
      'clip': instance.clip,
      'description_raw': instance.descriptionRaw,
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

_$_Developer _$$_DeveloperFromJson(Map<String, dynamic> json) => _$_Developer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      gamesCount: json['games_count'] as int?,
      imageBackground: json['image_background'] as String?,
      domain: json['domain'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$$_DeveloperToJson(_$_Developer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'games_count': instance.gamesCount,
      'image_background': instance.imageBackground,
      'domain': instance.domain,
      'language': instance.language,
    };

_$_MetacriticPlatform _$$_MetacriticPlatformFromJson(
        Map<String, dynamic> json) =>
    _$_MetacriticPlatform(
      metascore: json['metascore'] as int?,
      url: json['url'] as String?,
      platform: json['platform'] == null
          ? null
          : MetacriticPlatformPlatform.fromJson(
              json['platform'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MetacriticPlatformToJson(
        _$_MetacriticPlatform instance) =>
    <String, dynamic>{
      'metascore': instance.metascore,
      'url': instance.url,
      'platform': instance.platform?.toJson(),
    };

_$_MetacriticPlatformPlatform _$$_MetacriticPlatformPlatformFromJson(
        Map<String, dynamic> json) =>
    _$_MetacriticPlatformPlatform(
      platform: json['platform'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$$_MetacriticPlatformPlatformToJson(
        _$_MetacriticPlatformPlatform instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'name': instance.name,
      'slug': instance.slug,
    };

_$_ParentPlatform _$$_ParentPlatformFromJson(Map<String, dynamic> json) =>
    _$_ParentPlatform(
      platform: json['platform'] == null
          ? null
          : ParentPlatformPlatform.fromJson(
              json['platform'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ParentPlatformToJson(_$_ParentPlatform instance) =>
    <String, dynamic>{
      'platform': instance.platform?.toJson(),
    };

_$_ParentPlatformPlatform _$$_ParentPlatformPlatformFromJson(
        Map<String, dynamic> json) =>
    _$_ParentPlatformPlatform(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$$_ParentPlatformPlatformToJson(
        _$_ParentPlatformPlatform instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

_$_PlatformElement _$$_PlatformElementFromJson(Map<String, dynamic> json) =>
    _$_PlatformElement(
      platform: json['platform'] == null
          ? null
          : PlatformPlatform.fromJson(json['platform'] as Map<String, dynamic>),
      releasedAt: json['released_at'] as String?,
      requirements: json['requirements'] == null
          ? null
          : Requirements.fromJson(json['requirements'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PlatformElementToJson(_$_PlatformElement instance) =>
    <String, dynamic>{
      'platform': instance.platform?.toJson(),
      'released_at': instance.releasedAt,
      'requirements': instance.requirements?.toJson(),
    };

_$_PlatformPlatform _$$_PlatformPlatformFromJson(Map<String, dynamic> json) =>
    _$_PlatformPlatform(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'],
      yearEnd: json['year_end'],
      yearStart: json['year_start'] as int?,
      gamesCount: json['games_count'] as int?,
      imageBackground: json['image_background'] as String?,
    );

Map<String, dynamic> _$$_PlatformPlatformToJson(_$_PlatformPlatform instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'year_end': instance.yearEnd,
      'year_start': instance.yearStart,
      'games_count': instance.gamesCount,
      'image_background': instance.imageBackground,
    };

_$_Requirements _$$_RequirementsFromJson(Map<String, dynamic> json) =>
    _$_Requirements(
      minimum: json['minimum'] as String?,
      recommended: json['recommended'] as String?,
    );

Map<String, dynamic> _$$_RequirementsToJson(_$_Requirements instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'recommended': instance.recommended,
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

_$_Reactions _$$_ReactionsFromJson(Map<String, dynamic> json) => _$_Reactions();

Map<String, dynamic> _$$_ReactionsToJson(_$_Reactions instance) =>
    <String, dynamic>{};

_$_Store _$$_StoreFromJson(Map<String, dynamic> json) => _$_Store(
      id: json['id'] as int?,
      url: json['url'] as String?,
      store: json['store'] == null
          ? null
          : Developer.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'store': instance.store?.toJson(),
    };
