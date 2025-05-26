import 'package:json_annotation/json_annotation.dart';

part 'subscribe_to_aution_model.g.dart';

@JsonSerializable()
class SubscribeToAutionModel {
  final bool status;
  final String message;
  final dynamic data;

  SubscribeToAutionModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory SubscribeToAutionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscribeToAutionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscribeToAutionModelToJson(this);
}
