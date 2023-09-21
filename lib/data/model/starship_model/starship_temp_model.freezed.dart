// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'starship_temp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StarshipTempModel _$StarshipTempModelFromJson(Map<String, dynamic> json) {
  return _StarshipTempModel.fromJson(json);
}

/// @nodoc
class _$StarshipTempModelTearOff {
  const _$StarshipTempModelTearOff();

  _StarshipTempModel call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "listData") List<StarshipModel>? listData}) {
    return _StarshipTempModel(
      name: name,
      listData: listData,
    );
  }

  StarshipTempModel fromJson(Map<String, Object?> json) {
    return StarshipTempModel.fromJson(json);
  }
}

/// @nodoc
const $StarshipTempModel = _$StarshipTempModelTearOff();

/// @nodoc
mixin _$StarshipTempModel {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "listData")
  List<StarshipModel>? get listData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StarshipTempModelCopyWith<StarshipTempModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StarshipTempModelCopyWith<$Res> {
  factory $StarshipTempModelCopyWith(
          StarshipTempModel value, $Res Function(StarshipTempModel) then) =
      _$StarshipTempModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "listData") List<StarshipModel>? listData});
}

/// @nodoc
class _$StarshipTempModelCopyWithImpl<$Res>
    implements $StarshipTempModelCopyWith<$Res> {
  _$StarshipTempModelCopyWithImpl(this._value, this._then);

  final StarshipTempModel _value;
  // ignore: unused_field
  final $Res Function(StarshipTempModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? listData = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      listData: listData == freezed
          ? _value.listData
          : listData // ignore: cast_nullable_to_non_nullable
              as List<StarshipModel>?,
    ));
  }
}

/// @nodoc
abstract class _$StarshipTempModelCopyWith<$Res>
    implements $StarshipTempModelCopyWith<$Res> {
  factory _$StarshipTempModelCopyWith(
          _StarshipTempModel value, $Res Function(_StarshipTempModel) then) =
      __$StarshipTempModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "listData") List<StarshipModel>? listData});
}

/// @nodoc
class __$StarshipTempModelCopyWithImpl<$Res>
    extends _$StarshipTempModelCopyWithImpl<$Res>
    implements _$StarshipTempModelCopyWith<$Res> {
  __$StarshipTempModelCopyWithImpl(
      _StarshipTempModel _value, $Res Function(_StarshipTempModel) _then)
      : super(_value, (v) => _then(v as _StarshipTempModel));

  @override
  _StarshipTempModel get _value => super._value as _StarshipTempModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? listData = freezed,
  }) {
    return _then(_StarshipTempModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      listData: listData == freezed
          ? _value.listData
          : listData // ignore: cast_nullable_to_non_nullable
              as List<StarshipModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StarshipTempModel implements _StarshipTempModel {
  const _$_StarshipTempModel(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "listData") this.listData});

  factory _$_StarshipTempModel.fromJson(Map<String, dynamic> json) =>
      _$$_StarshipTempModelFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "listData")
  final List<StarshipModel>? listData;

  @override
  String toString() {
    return 'StarshipTempModel(name: $name, listData: $listData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StarshipTempModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.listData, listData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(listData));

  @JsonKey(ignore: true)
  @override
  _$StarshipTempModelCopyWith<_StarshipTempModel> get copyWith =>
      __$StarshipTempModelCopyWithImpl<_StarshipTempModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StarshipTempModelToJson(this);
  }
}

abstract class _StarshipTempModel implements StarshipTempModel {
  const factory _StarshipTempModel(
          {@JsonKey(name: "name") String? name,
          @JsonKey(name: "listData") List<StarshipModel>? listData}) =
      _$_StarshipTempModel;

  factory _StarshipTempModel.fromJson(Map<String, dynamic> json) =
      _$_StarshipTempModel.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "listData")
  List<StarshipModel>? get listData;
  @override
  @JsonKey(ignore: true)
  _$StarshipTempModelCopyWith<_StarshipTempModel> get copyWith =>
      throw _privateConstructorUsedError;
}
