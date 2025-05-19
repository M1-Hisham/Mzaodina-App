// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      terms: json['terms'] as bool,
      country: json['country'] as String,
      phone: json['phone'] as String,
      phoneCode: json['phone_code'] as String,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'terms': instance.terms,
      'country': instance.country,
      'phone': instance.phone,
      'phone_code': instance.phoneCode,
    };
