// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordUpdateResponse _$PasswordUpdateResponseFromJson(
  Map<String, dynamic> json,
) => PasswordUpdateResponse(
  status: json['status'] as bool,
  message: json['message'] as String,
  data: json['data'] as String,
);

Map<String, dynamic> _$PasswordUpdateResponseToJson(
  PasswordUpdateResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
