import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'token_type')
  final String? tokenType;

  @JsonKey(name: 'expires_in')
  final int? expiresIn;

  final String? error;

  LoginResponseModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.error,
  });

  /// ✅ Factory method to create an instance from JSON
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  /// ✅ Method to convert the instance to JSON
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
