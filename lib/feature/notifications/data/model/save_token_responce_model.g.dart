// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_token_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveTokenResponceModel _$SaveTokenResponceModelFromJson(
  Map<String, dynamic> json,
) => SaveTokenResponceModel(
  status: json['status'] as bool,
  message: json['message'] as String,
  data: json['data'],
);

Map<String, dynamic> _$SaveTokenResponceModelToJson(
  SaveTokenResponceModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
