import 'package:json_annotation/json_annotation.dart';

part 'mark_notification.g.dart';

@JsonSerializable()
class MarkNotificationModel {
  final bool status;
  final String message;
  final String data;

  MarkNotificationModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MarkNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$MarkNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$MarkNotificationToJson(this);
}
