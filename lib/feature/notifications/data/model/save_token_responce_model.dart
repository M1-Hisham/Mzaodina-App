import 'package:json_annotation/json_annotation.dart';

part 'save_token_responce_model.g.dart';

@JsonSerializable()
class SaveTokenResponceModel {
  final bool status;
  final String message;
  final dynamic data;

  SaveTokenResponceModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory SaveTokenResponceModel.fromJson(Map<String, dynamic> json) =>
      _$SaveTokenResponceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveTokenResponceModelToJson(this);
}
