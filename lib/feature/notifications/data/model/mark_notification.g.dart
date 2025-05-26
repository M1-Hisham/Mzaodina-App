// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkNotificationModel _$MarkNotificationFromJson(Map<String, dynamic> json) =>
    MarkNotificationModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$MarkNotificationToJson(MarkNotificationModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
