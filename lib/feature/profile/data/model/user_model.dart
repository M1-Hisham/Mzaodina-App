import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final bool status;
  final String message;
  final UserData? data;

  UserModel({required this.status, required this.message, this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UserData {
  final int id;
  final String? name;
  final String username;
  final String email;
  final String? country;
  final String? phone;
  @JsonKey(name: 'phone_code')
  final String? phoneCode;
  final Address? address;
  final String? provider;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'profile_photo_url')
  final String? profilePhotoUrl;

  UserData({
    required this.id,
    this.name,
    required this.username,
    required this.email,
    this.country,
    this.phone,
    this.phoneCode,
    this.address,
    this.provider,
    required this.createdAt,
    this.profilePhotoUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class Address {
  final String? city;
  final String? street;
  final String? neighborhood;

  Address({this.city, this.street, this.neighborhood});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
