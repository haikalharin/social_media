// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'people_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeopleModel _$PeopleModelFromJson(Map<String, dynamic> json) {
  return _PeopleModel.fromJson(json);
}

/// @nodoc
class _$PeopleModelTearOff {
  const _$PeopleModelTearOff();

  _PeopleModel call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "lastName") String? lastName,
      @JsonKey(name: "gender") String? gender,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "dateOfBirth") String? dateOfBirth,
      @JsonKey(name: "registerDate") String? registerDate,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "picture") String? picture,
      @JsonKey(name: "location") Location? location}) {
    return _PeopleModel(
      id: id,
      title: title,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      email: email,
      dateOfBirth: dateOfBirth,
      registerDate: registerDate,
      phone: phone,
      picture: picture,
      location: location,
    );
  }

  PeopleModel fromJson(Map<String, Object?> json) {
    return PeopleModel.fromJson(json);
  }
}

/// @nodoc
const $PeopleModel = _$PeopleModelTearOff();

/// @nodoc
mixin _$PeopleModel {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "firstName")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "lastName")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "gender")
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "dateOfBirth")
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: "registerDate")
  String? get registerDate => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "picture")
  String? get picture => throw _privateConstructorUsedError;
  @JsonKey(name: "location")
  Location? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeopleModelCopyWith<PeopleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeopleModelCopyWith<$Res> {
  factory $PeopleModelCopyWith(
          PeopleModel value, $Res Function(PeopleModel) then) =
      _$PeopleModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "lastName") String? lastName,
      @JsonKey(name: "gender") String? gender,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "dateOfBirth") String? dateOfBirth,
      @JsonKey(name: "registerDate") String? registerDate,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "picture") String? picture,
      @JsonKey(name: "location") Location? location});

  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class _$PeopleModelCopyWithImpl<$Res> implements $PeopleModelCopyWith<$Res> {
  _$PeopleModelCopyWithImpl(this._value, this._then);

  final PeopleModel _value;
  // ignore: unused_field
  final $Res Function(PeopleModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? dateOfBirth = freezed,
    Object? registerDate = freezed,
    Object? phone = freezed,
    Object? picture = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      registerDate: registerDate == freezed
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
    ));
  }

  @override
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
abstract class _$PeopleModelCopyWith<$Res>
    implements $PeopleModelCopyWith<$Res> {
  factory _$PeopleModelCopyWith(
          _PeopleModel value, $Res Function(_PeopleModel) then) =
      __$PeopleModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "lastName") String? lastName,
      @JsonKey(name: "gender") String? gender,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "dateOfBirth") String? dateOfBirth,
      @JsonKey(name: "registerDate") String? registerDate,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "picture") String? picture,
      @JsonKey(name: "location") Location? location});

  @override
  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class __$PeopleModelCopyWithImpl<$Res> extends _$PeopleModelCopyWithImpl<$Res>
    implements _$PeopleModelCopyWith<$Res> {
  __$PeopleModelCopyWithImpl(
      _PeopleModel _value, $Res Function(_PeopleModel) _then)
      : super(_value, (v) => _then(v as _PeopleModel));

  @override
  _PeopleModel get _value => super._value as _PeopleModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? dateOfBirth = freezed,
    Object? registerDate = freezed,
    Object? phone = freezed,
    Object? picture = freezed,
    Object? location = freezed,
  }) {
    return _then(_PeopleModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      registerDate: registerDate == freezed
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeopleModel implements _PeopleModel {
  const _$_PeopleModel(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "firstName") this.firstName,
      @JsonKey(name: "lastName") this.lastName,
      @JsonKey(name: "gender") this.gender,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "dateOfBirth") this.dateOfBirth,
      @JsonKey(name: "registerDate") this.registerDate,
      @JsonKey(name: "phone") this.phone,
      @JsonKey(name: "picture") this.picture,
      @JsonKey(name: "location") this.location});

  factory _$_PeopleModel.fromJson(Map<String, dynamic> json) =>
      _$$_PeopleModelFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "firstName")
  final String? firstName;
  @override
  @JsonKey(name: "lastName")
  final String? lastName;
  @override
  @JsonKey(name: "gender")
  final String? gender;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "dateOfBirth")
  final String? dateOfBirth;
  @override
  @JsonKey(name: "registerDate")
  final String? registerDate;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "picture")
  final String? picture;
  @override
  @JsonKey(name: "location")
  final Location? location;

  @override
  String toString() {
    return 'PeopleModel(id: $id, title: $title, firstName: $firstName, lastName: $lastName, gender: $gender, email: $email, dateOfBirth: $dateOfBirth, registerDate: $registerDate, phone: $phone, picture: $picture, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PeopleModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            const DeepCollectionEquality()
                .equals(other.registerDate, registerDate) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.picture, picture) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(dateOfBirth),
      const DeepCollectionEquality().hash(registerDate),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(picture),
      const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$PeopleModelCopyWith<_PeopleModel> get copyWith =>
      __$PeopleModelCopyWithImpl<_PeopleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeopleModelToJson(this);
  }
}

abstract class _PeopleModel implements PeopleModel {
  const factory _PeopleModel(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "lastName") String? lastName,
      @JsonKey(name: "gender") String? gender,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "dateOfBirth") String? dateOfBirth,
      @JsonKey(name: "registerDate") String? registerDate,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "picture") String? picture,
      @JsonKey(name: "location") Location? location}) = _$_PeopleModel;

  factory _PeopleModel.fromJson(Map<String, dynamic> json) =
      _$_PeopleModel.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "firstName")
  String? get firstName;
  @override
  @JsonKey(name: "lastName")
  String? get lastName;
  @override
  @JsonKey(name: "gender")
  String? get gender;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "dateOfBirth")
  String? get dateOfBirth;
  @override
  @JsonKey(name: "registerDate")
  String? get registerDate;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "picture")
  String? get picture;
  @override
  @JsonKey(name: "location")
  Location? get location;
  @override
  @JsonKey(ignore: true)
  _$PeopleModelCopyWith<_PeopleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
class _$LocationTearOff {
  const _$LocationTearOff();

  _Location call(
      {@JsonKey(name: "street") String? street,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "state") String? state,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "timezone") String? timezone}) {
    return _Location(
      street: street,
      city: city,
      state: state,
      country: country,
      timezone: timezone,
    );
  }

  Location fromJson(Map<String, Object?> json) {
    return Location.fromJson(json);
  }
}

/// @nodoc
const $Location = _$LocationTearOff();

/// @nodoc
mixin _$Location {
  @JsonKey(name: "street")
  String? get street => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "state")
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: "country")
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: "timezone")
  String? get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "street") String? street,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "state") String? state,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "timezone") String? timezone});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

  @override
  $Res call({
    Object? street = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_value.copyWith(
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) then) =
      __$LocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "street") String? street,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "state") String? state,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "timezone") String? timezone});
}

/// @nodoc
class __$LocationCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(_Location _value, $Res Function(_Location) _then)
      : super(_value, (v) => _then(v as _Location));

  @override
  _Location get _value => super._value as _Location;

  @override
  $Res call({
    Object? street = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_Location(
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Location implements _Location {
  const _$_Location(
      {@JsonKey(name: "street") this.street,
      @JsonKey(name: "city") this.city,
      @JsonKey(name: "state") this.state,
      @JsonKey(name: "country") this.country,
      @JsonKey(name: "timezone") this.timezone});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override
  @JsonKey(name: "street")
  final String? street;
  @override
  @JsonKey(name: "city")
  final String? city;
  @override
  @JsonKey(name: "state")
  final String? state;
  @override
  @JsonKey(name: "country")
  final String? country;
  @override
  @JsonKey(name: "timezone")
  final String? timezone;

  @override
  String toString() {
    return 'Location(street: $street, city: $city, state: $state, country: $country, timezone: $timezone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Location &&
            const DeepCollectionEquality().equals(other.street, street) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.timezone, timezone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(street),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(timezone));

  @JsonKey(ignore: true)
  @override
  _$LocationCopyWith<_Location> get copyWith =>
      __$LocationCopyWithImpl<_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationToJson(this);
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {@JsonKey(name: "street") String? street,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "state") String? state,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "timezone") String? timezone}) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  @JsonKey(name: "street")
  String? get street;
  @override
  @JsonKey(name: "city")
  String? get city;
  @override
  @JsonKey(name: "state")
  String? get state;
  @override
  @JsonKey(name: "country")
  String? get country;
  @override
  @JsonKey(name: "timezone")
  String? get timezone;
  @override
  @JsonKey(ignore: true)
  _$LocationCopyWith<_Location> get copyWith =>
      throw _privateConstructorUsedError;
}
