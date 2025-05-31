import 'package:json_annotation/json_annotation.dart';

part 'tap_checkout_url_model.g.dart';

@JsonSerializable()
class TapCheckoutUrlModel {
  final String url;

  TapCheckoutUrlModel({required this.url});

  factory TapCheckoutUrlModel.fromJson(Map<String, dynamic> json) =>
      _$TapCheckoutUrlModelFromJson(json);

  Map<String, dynamic> toJson() => _$TapCheckoutUrlModelToJson(this);
}
