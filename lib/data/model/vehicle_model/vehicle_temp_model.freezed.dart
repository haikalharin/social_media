// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vehicle_temp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VehicleTempModel _$VehicleTempModelFromJson(Map<String, dynamic> json) {
  return _VehicleTempModel.fromJson(json);
}

/// @nodoc
class _$VehicleTempModelTearOff {
  const _$VehicleTempModelTearOff();

  _VehicleTempModel call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "listData") List<VehicleModel>? listData}) {
    return _VehicleTempModel(
      name: name,
      listData: listData,
    );
  }

  VehicleTempModel fromJson(Map<String, Object?> json) {
    return VehicleTempModel.fromJson(json);
  }
}

/// @nodoc
const $VehicleTempModel = _$VehicleTempModelTearOff();

/// @nodoc
mixin _$VehicleTempModel {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "listData")
  List<VehicleModel>? get listData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleTempModelCopyWith<VehicleTempModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleTempModelCopyWith<$Res> {
  factory $VehicleTempModelCopyWith(
          VehicleTempModel value, $Res Function(VehicleTempModel) then) =
      _$VehicleTempModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "listData") List<VehicleModel>? listData});
}

/// @nodoc
class _$VehicleTempModelCopyWithImpl<$Res>
    implements $VehicleTempModelCopyWith<$Res> {
  _$VehicleTempModelCopyWithImpl(this._value, this._then);

  final VehicleTempModel _value;
  // ignore: unused_field
  final $Res Function(VehicleTempModel) _then;

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
              as List<VehicleModel>?,
    ));
  }
}

/// @nodoc
abstract class _$VehicleTempModelCopyWith<$Res>
    implements $VehicleTempModelCopyWith<$Res> {
  factory _$VehicleTempModelCopyWith(
          _VehicleTempModel value, $Res Function(_VehicleTempModel) then) =
      __$VehicleTempModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "listData") List<VehicleModel>? listData});
}

/// @nodoc
class __$VehicleTempModelCopyWithImpl<$Res>
    extends _$VehicleTempModelCopyWithImpl<$Res>
    implements _$VehicleTempModelCopyWith<$Res> {
  __$VehicleTempModelCopyWithImpl(
      _VehicleTempModel _value, $Res Function(_VehicleTempModel) _then)
      : super(_value, (v) => _then(v as _VehicleTempModel));

  @override
  _VehicleTempModel get _value => super._value as _VehicleTempModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? listData = freezed,
  }) {
    return _then(_VehicleTempModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      listData: listData == freezed
          ? _value.listData
          : listData // ignore: cast_nullable_to_non_nullable
              as List<VehicleModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VehicleTempModel implements _VehicleTempModel {
  const _$_VehicleTempModel(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "listData") this.listData});

  factory _$_VehicleTempModel.fromJson(Map<String, dynamic> json) =>
      _$$_VehicleTempModelFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "listData")
  final List<VehicleModel>? listData;

  @override
  String toString() {
    return 'VehicleTempModel(name: $name, listData: $listData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VehicleTempModel &&
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
  _$VehicleTempModelCopyWith<_VehicleTempModel> get copyWith =>
      __$VehicleTempModelCopyWithImpl<_VehicleTempModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VehicleTempModelToJson(this);
  }
}

abstract class _VehicleTempModel implements VehicleTempModel {
  const factory _VehicleTempModel(
          {@JsonKey(name: "name") String? name,
          @JsonKey(name: "listData") List<VehicleModel>? listData}) =
      _$_VehicleTempModel;

  factory _VehicleTempModel.fromJson(Map<String, dynamic> json) =
      _$_VehicleTempModel.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "listData")
  List<VehicleModel>? get listData;
  @override
  @JsonKey(ignore: true)
  _$VehicleTempModelCopyWith<_VehicleTempModel> get copyWith =>
      throw _privateConstructorUsedError;
}
