import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_response.g.dart';

@JsonSerializable()
class ForgotPasswordResponse {
  final String message;

  ForgotPasswordResponse({required this.message});

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}
