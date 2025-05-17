// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  status: json['status'] as bool,
  message: json['message'] as String,
  data:
      json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String?,
  username: json['username'] as String,
  email: json['email'] as String,
  country: json['country'] as String,
  phone: json['phone'] as String,
  phone_code: json['phone_code'] as String,
  address:
      json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
  provider: json['provider'] as String?,
  created_at: json['created_at'] as String,
  profile_photo_url: json['profile_photo_url'] as String,
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'username': instance.username,
  'email': instance.email,
  'country': instance.country,
  'phone': instance.phone,
  'phone_code': instance.phone_code,
  'address': instance.address,
  'provider': instance.provider,
  'created_at': instance.created_at,
  'profile_photo_url': instance.profile_photo_url,
};

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
  city: json['city'] as String?,
  street: json['street'] as String?,
  neighborhood: json['neighborhood'] as String?,
);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'city': instance.city,
  'street': instance.street,
  'neighborhood': instance.neighborhood,
};
