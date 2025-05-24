import 'package:json_annotation/json_annotation.dart';

part 'register_to_aution_model.g.dart';

@JsonSerializable()
class RegisterToAutionModel {
  final bool status;
  final String message;
  final dynamic data;

  RegisterToAutionModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory RegisterToAutionModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterToAutionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterToAutionModelToJson(this);
}
