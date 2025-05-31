import 'package:json_annotation/json_annotation.dart';

part 'password_update_response.g.dart';

@JsonSerializable()
class PasswordUpdateResponse {
  final bool status;
  final String message;
  final String data;

  PasswordUpdateResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PasswordUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$PasswordUpdateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordUpdateResponseToJson(this);
}
