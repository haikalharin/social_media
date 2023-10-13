// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    @JsonKey(name: "id")
    String? id,
    @JsonKey(name: "image")
    String? image,
    @JsonKey(name: "likes")
    int? likes,
    @JsonKey(name: "tags")
    List<String>? tags,
    @JsonKey(name: "text")
    String? text,
    @JsonKey(name: "publishDate")
    String? publishDate,
    @JsonKey(name: "owner")
    Owner? owner,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}

@freezed
class Owner with _$Owner {
  const factory Owner({
    @JsonKey(name: "id")
    String? id,
    @JsonKey(name: "title")
    String? title,
    @JsonKey(name: "firstName")
    String? firstName,
    @JsonKey(name: "lastName")
    String? lastName,
    @JsonKey(name: "picture")
    String? picture,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
