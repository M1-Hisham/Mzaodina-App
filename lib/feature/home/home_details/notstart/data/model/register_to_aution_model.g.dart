// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_to_aution_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterToAutionModel _$RegisterToAutionModelFromJson(
  Map<String, dynamic> json,
) => RegisterToAutionModel(
  status: json['status'] as bool,
  message: json['message'] as String,
  data: json['data'],
);

Map<String, dynamic> _$RegisterToAutionModelToJson(
  RegisterToAutionModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
