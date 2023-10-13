// To parse this JSON data, do
//
//     final peopleModel = peopleModelFromJson(jsonString?);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'people_model.freezed.dart';
part 'people_model.g.dart';

PeopleModel peopleModelFromJson(String str) => PeopleModel.fromJson(json.decode(str));

String peopleModelToJson(PeopleModel data) => json.encode(data.toJson());

@freezed
class PeopleModel with _$PeopleModel {
  const factory PeopleModel({
    @JsonKey(name: "id")
    String? id,
    @JsonKey(name: "title")
    String? title,
    @JsonKey(name: "firstName")
    String? firstName,
    @JsonKey(name: "lastName")
    String? lastName,
    @JsonKey(name: "gender")
    String? gender,
    @JsonKey(name: "email")
    String? email,
    @JsonKey(name: "dateOfBirth")
    String? dateOfBirth,
    @JsonKey(name: "registerDate")
    String? registerDate,
    @JsonKey(name: "phone")
    String? phone,
    @JsonKey(name: "picture")
    String? picture,
    @JsonKey(name: "location")
    Location? location,
  }) = _PeopleModel;

  factory PeopleModel.fromJson(Map<String, dynamic> json) => _$PeopleModelFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    @JsonKey(name: "street")
    String? street,
    @JsonKey(name: "city")
    String? city,
    @JsonKey(name: "state")
    String? state,
    @JsonKey(name: "country")
    String? country,
 @JsonKey(name: "timezone")
    String? timezone,

  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}
