// To parse this JSON data, do
//
//     final peopleModel = peopleModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'people_model.freezed.dart';
part 'people_model.g.dart';

PeopleModel peopleModelFromJson(String str) => PeopleModel.fromJson(json.decode(str));

String peopleModelToJson(PeopleModel data) => json.encode(data.toJson());

@freezed
class PeopleModel with _$PeopleModel {
  const factory PeopleModel({
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "height")
    String? height,
    @JsonKey(name: "mass")
    String? mass,
    @JsonKey(name: "hair_color")
    String? hairColor,
    @JsonKey(name: "skin_color")
    String? skinColor,
    @JsonKey(name: "eye_color")
    String? eyeColor,
    @JsonKey(name: "birth_year")
    String? birthYear,
    @JsonKey(name: "gender")
    String? gender,
    @JsonKey(name: "homeworld")
    String? homeworld,
    @JsonKey(name: "films")
    List<String>? films,
    @JsonKey(name: "species")
    List<dynamic>? species,
    @JsonKey(name: "vehicles")
    List<String>? vehicles,
    @JsonKey(name: "starships")
    List<String>? starships,
    @JsonKey(name: "created")
    String? created,
    @JsonKey(name: "edited")
    String? edited,
    @JsonKey(name: "url")
    String? url,
  }) = _PeopleModel;

  factory PeopleModel.fromJson(Map<String, dynamic> json) => _$PeopleModelFromJson(json);
}
