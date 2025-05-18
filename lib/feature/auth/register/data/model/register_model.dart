import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  final String username;
  final String email;
  final String password;
  final bool terms;
  final String country;
  final String phone;
  final String phone_code;

  RegisterModel({
    required this.username,
    required this.email,
    required this.password,
    required this.terms,
    required this.country,
    required this.phone,
    required this.phone_code,
  });

  /// تحويل من JSON إلى كائن Dart
  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  /// تحويل من كائن Dart إلى JSON
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}