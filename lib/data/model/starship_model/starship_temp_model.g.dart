// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starship_temp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StarshipTempModel _$$_StarshipTempModelFromJson(Map<String, dynamic> json) =>
    _$_StarshipTempModel(
      name: json['name'] as String?,
      listData: (json['listData'] as List<dynamic>?)
          ?.map((e) => StarshipModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StarshipTempModelToJson(
        _$_StarshipTempModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'listData': instance.listData,
    };
