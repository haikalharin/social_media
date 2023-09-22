// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_temp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VehicleTempModel _$$_VehicleTempModelFromJson(Map<String, dynamic> json) =>
    _$_VehicleTempModel(
      name: json['name'] as String?,
      listData: (json['listData'] as List<dynamic>?)
          ?.map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VehicleTempModelToJson(_$_VehicleTempModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'listData': instance.listData,
    };
