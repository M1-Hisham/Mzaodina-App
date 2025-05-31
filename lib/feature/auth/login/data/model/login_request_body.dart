import 'package:json_annotation/json_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  final String email;
  final String password;

  LoginRequestBody({
    required this.email,
    required this.password,
  });

  /// ✅ Factory method to create an instance from JSON
  factory LoginRequestBody.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestBodyFromJson(json);

  /// ✅ Method to convert the instance to JSON
  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
