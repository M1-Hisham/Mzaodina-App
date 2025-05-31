import 'package:json_annotation/json_annotation.dart';

part 'payment_invoice_model.g.dart';

@JsonSerializable()
class PaymentInvoiceModel {
  final bool status;
  final String message;
  final PaymentInvoiceData data;

  PaymentInvoiceModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PaymentInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentInvoiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentInvoiceModelToJson(this);
}

@JsonSerializable()
class PaymentInvoiceData {
  final String url;

  PaymentInvoiceData({required this.url});

  factory PaymentInvoiceData.fromJson(Map<String, dynamic> json) =>
      _$PaymentInvoiceDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentInvoiceDataToJson(this);
}
