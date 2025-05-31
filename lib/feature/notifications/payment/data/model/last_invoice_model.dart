import 'package:json_annotation/json_annotation.dart';

part 'last_invoice_model.g.dart';

@JsonSerializable()
class LastInvoiceModel {
  final bool status;
  final String message;
  final LastInvoiceData data;

  LastInvoiceModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LastInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$LastInvoiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$LastInvoiceModelToJson(this);
}

@JsonSerializable()
class LastInvoiceData {
  @JsonKey(name: 'invoice_number')
  final String invoiceNumber;

  @JsonKey(name: 'invoice_price')
  final String invoicePrice;

  final String status;

  @JsonKey(name: 'expires_at')
  final String expiresAt;

  final InvoiceUser user;

  LastInvoiceData({
    required this.invoiceNumber,
    required this.invoicePrice,
    required this.status,
    required this.expiresAt,
    required this.user,
  });

  factory LastInvoiceData.fromJson(Map<String, dynamic> json) =>
      _$LastInvoiceDataFromJson(json);

  Map<String, dynamic> toJson() => _$LastInvoiceDataToJson(this);
}

@JsonSerializable()
class InvoiceUser {
  final int id;
  final String name;
  final String username;

  InvoiceUser({required this.id, required this.name, required this.username});

  factory InvoiceUser.fromJson(Map<String, dynamic> json) =>
      _$InvoiceUserFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceUserToJson(this);
}
