// To parse this JSON data, do
//
//     final planetModel = planetModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'planet_model.freezed.dart';
part 'planet_model.g.dart';

PlanetModel planetModelFromJson(String str) => PlanetModel.fromJson(json.decode(str));

String planetModelToJson(PlanetModel data) => json.encode(data.toJson());

@freezed
class PlanetModel with _$PlanetModel {
  const factory PlanetModel({
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "rotation_period")
    String? rotationPeriod,
    @JsonKey(name: "orbital_period")
    String? orbitalPeriod,
    @JsonKey(name: "diameter")
    String? diameter,
    @JsonKey(name: "climate")
    String? climate,
    @JsonKey(name: "gravity")
    String? gravity,
    @JsonKey(name: "terrain")
    String? terrain,
    @JsonKey(name: "surface_water")
    String? surfaceWater,
    @JsonKey(name: "population")
    String? population,
    @JsonKey(name: "residents")
    List<String>? residents,
    @JsonKey(name: "films")
    List<String>? films,
    @JsonKey(name: "created")
    String? created,
    @JsonKey(name: "edited")
    String? edited,
    @JsonKey(name: "url")
    String? url,
  }) = _PlanetModel;

  factory PlanetModel.fromJson(Map<String, dynamic> json) => _$PlanetModelFromJson(json);
}
