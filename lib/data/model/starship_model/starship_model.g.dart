// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StarshipModel _$$_StarshipModelFromJson(Map<String, dynamic> json) =>
    _$_StarshipModel(
      mglt: json['MGLT'] as String?,
      cargoCapacity: json['cargo_capacity'] as String?,
      consumables: json['consumables'] as String?,
      costInCredits: json['cost_in_credits'] as String?,
      created: json['created'] as String?,
      crew: json['crew'] as String?,
      edited: json['edited'] as String?,
      hyperdriveRating: json['hyperdrive_rating'] as String?,
      length: json['length'] as String?,
      manufacturer: json['manufacturer'] as String?,
      maxAtmospheringSpeed: json['max_atmosphering_speed'] as String?,
      model: json['model'] as String?,
      name: json['name'] as String?,
      passengers: json['passengers'] as String?,
      films:
          (json['films'] as List<dynamic>?)?.map((e) => e as String).toList(),
      pilots: json['pilots'] as List<dynamic>?,
      starshipClass: json['starship_class'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_StarshipModelToJson(_$_StarshipModel instance) =>
    <String, dynamic>{
      'MGLT': instance.mglt,
      'cargo_capacity': instance.cargoCapacity,
      'consumables': instance.consumables,
      'cost_in_credits': instance.costInCredits,
      'created': instance.created,
      'crew': instance.crew,
      'edited': instance.edited,
      'hyperdrive_rating': instance.hyperdriveRating,
      'length': instance.length,
      'manufacturer': instance.manufacturer,
      'max_atmosphering_speed': instance.maxAtmospheringSpeed,
      'model': instance.model,
      'name': instance.name,
      'passengers': instance.passengers,
      'films': instance.films,
      'pilots': instance.pilots,
      'starship_class': instance.starshipClass,
      'url': instance.url,
    };
