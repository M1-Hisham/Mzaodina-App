import 'package:json_annotation/json_annotation.dart';

part 'payment_invoice_model.g.dart';

@JsonSerializable()
class PaymentInvoiceModel {
  final String url;

  PaymentInvoiceModel({required this.url});

  factory PaymentInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentInvoiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentInvoiceModelToJson(this);
}
