// To parse this JSON data, do
//
//     final vehicleTempModel = vehicleTempModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:social_media/data/model/vehicle_model/vehicle_model.dart';

part 'vehicle_temp_model.freezed.dart';
part 'vehicle_temp_model.g.dart';

VehicleTempModel vehicleTempModelFromJson(String str) => VehicleTempModel.fromJson(json.decode(str));

String vehicleTempModelToJson(VehicleTempModel data) => json.encode(data.toJson());

@freezed
class VehicleTempModel with _$VehicleTempModel {
  const factory VehicleTempModel({
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "listData")
    List<VehicleModel>? listData,
  }) = _VehicleTempModel;

  factory VehicleTempModel.fromJson(Map<String, dynamic> json) => _$VehicleTempModelFromJson(json);
}