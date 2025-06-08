// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoResponse _$InfoResponseFromJson(Map<String, dynamic> json) => InfoResponse(
  status: json['status'] as bool,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$InfoResponseToJson(InfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
