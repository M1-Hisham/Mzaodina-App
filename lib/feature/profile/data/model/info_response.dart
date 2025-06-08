import 'package:json_annotation/json_annotation.dart';

part 'info_response.g.dart';

@JsonSerializable()
class InfoResponse {
  final bool status;
  final String message;
  final List<String> data;

  InfoResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory InfoResponse.fromJson(Map<String, dynamic> json) =>
      _$InfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InfoResponseToJson(this);
}
