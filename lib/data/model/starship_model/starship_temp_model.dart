// To parse this JSON data, do
//
//     final starshipTempModel = starshipTempModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:swapi/data/model/starship_model/starship_model.dart';

part 'starship_temp_model.freezed.dart';
part 'starship_temp_model.g.dart';

StarshipTempModel starshipTempModelFromJson(String str) => StarshipTempModel.fromJson(json.decode(str));

String starshipTempModelToJson(StarshipTempModel data) => json.encode(data.toJson());

@freezed
class StarshipTempModel with _$StarshipTempModel {
  const factory StarshipTempModel({
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "listData")
    List<StarshipModel>? listData,
  }) = _StarshipTempModel;

  factory StarshipTempModel.fromJson(Map<String, dynamic> json) => _$StarshipTempModelFromJson(json);
}