// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileBody _$UpdateProfileBodyFromJson(Map<String, dynamic> json) =>
    UpdateProfileBody(
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      phoneCountryCode: json['phone_country_code'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      street: json['street'] as String?,
      neighborhood: json['neighborhood'] as String?,
    );

Map<String, dynamic> _$UpdateProfileBodyToJson(UpdateProfileBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'phone_country_code': instance.phoneCountryCode,
      'country': instance.country,
      'city': instance.city,
      'street': instance.street,
      'neighborhood': instance.neighborhood,
    };
