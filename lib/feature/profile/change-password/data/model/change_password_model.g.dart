// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordModel _$ChangePasswordModelFromJson(Map<String, dynamic> json) =>
    ChangePasswordModel(
      currentPassword: json['current_password'] as String,
      newPassword: json['new_password'] as String,
      newPasswordConfirmation: json['new_password_confirmation'] as String,
    );

Map<String, dynamic> _$ChangePasswordModelToJson(
  ChangePasswordModel instance,
) => <String, dynamic>{
  'current_password': instance.currentPassword,
  'new_password': instance.newPassword,
  'new_password_confirmation': instance.newPasswordConfirmation,
};
