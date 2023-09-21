// To parse this JSON data, do
//
//     final starshipModel = starshipModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'starship_model.freezed.dart';
part 'starship_model.g.dart';

StarshipModel starshipModelFromJson(String str) => StarshipModel.fromJson(json.decode(str));

String starshipModelToJson(StarshipModel data) => json.encode(data.toJson());

@freezed
class StarshipModel with _$StarshipModel {
  const factory StarshipModel({
    @JsonKey(name: "MGLT")
    String? mglt,
    @JsonKey(name: "cargo_capacity")
    String? cargoCapacity,
    @JsonKey(name: "consumables")
    String? consumables,
    @JsonKey(name: "cost_in_credits")
    String? costInCredits,
    @JsonKey(name: "created")
    String? created,
    @JsonKey(name: "crew")
    String? crew,
    @JsonKey(name: "edited")
    String? edited,
    @JsonKey(name: "hyperdrive_rating")
    String? hyperdriveRating,
    @JsonKey(name: "length")
    String? length,
    @JsonKey(name: "manufacturer")
    String? manufacturer,
    @JsonKey(name: "max_atmosphering_speed")
    String? maxAtmospheringSpeed,
    @JsonKey(name: "model")
    String? model,
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "passengers")
    String? passengers,
    @JsonKey(name: "films")
    List<String>? films,
    @JsonKey(name: "pilots")
    List<dynamic>? pilots,
    @JsonKey(name: "starship_class")
    String? starshipClass,
    @JsonKey(name: "url")
    String? url,
  }) = _StarshipModel;

  factory StarshipModel.fromJson(Map<String, dynamic> json) => _$StarshipModelFromJson(json);
}
