// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'vehicle_model.freezed.dart';
part 'vehicle_model.g.dart';

VehicleModel vehicleModelFromJson(String str) => VehicleModel.fromJson(json.decode(str));

String vehicleModelToJson(VehicleModel data) => json.encode(data.toJson());

@freezed
class VehicleModel with _$VehicleModel {
  const factory VehicleModel({
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "model")
    String? model,
    @JsonKey(name: "manufacturer")
    String? manufacturer,
    @JsonKey(name: "cost_in_credits")
    String? costInCredits,
    @JsonKey(name: "length")
    String? length,
    @JsonKey(name: "max_atmosphering_speed")
    String? maxAtmospheringSpeed,
    @JsonKey(name: "crew")
    String? crew,
    @JsonKey(name: "passengers")
    String? passengers,
    @JsonKey(name: "cargo_capacity")
    String? cargoCapacity,
    @JsonKey(name: "consumables")
    String? consumables,
    @JsonKey(name: "vehicle_class")
    String? vehicleClass,
    @JsonKey(name: "pilots")
    List<dynamic>? pilots,
    @JsonKey(name: "films")
    List<String>? films,
    @JsonKey(name: "created")
    String? created,
    @JsonKey(name: "edited")
    String? edited,
    @JsonKey(name: "url")
    String? url,
  }) = _VehicleModel;

  factory VehicleModel.fromJson(Map<String, dynamic> json) => _$VehicleModelFromJson(json);
}
