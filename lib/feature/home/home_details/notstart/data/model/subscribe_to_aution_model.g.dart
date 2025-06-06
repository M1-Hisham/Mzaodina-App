// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_to_aution_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribeToAutionModel _$SubscribeToAutionModelFromJson(
  Map<String, dynamic> json,
) => SubscribeToAutionModel(
  status: json['status'] as bool,
  message: json['message'] as String,
  data: json['data'],
);

Map<String, dynamic> _$SubscribeToAutionModelToJson(
  SubscribeToAutionModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
