// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeopleModel _$$_PeopleModelFromJson(Map<String, dynamic> json) =>
    _$_PeopleModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      registerDate: json['registerDate'] as String?,
      phone: json['phone'] as String?,
      picture: json['picture'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PeopleModelToJson(_$_PeopleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth,
      'registerDate': instance.registerDate,
      'phone': instance.phone,
      'picture': instance.picture,
      'location': instance.location,
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      street: json['street'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'timezone': instance.timezone,
    };
