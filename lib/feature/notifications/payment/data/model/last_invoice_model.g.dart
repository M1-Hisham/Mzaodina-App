// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastInvoiceModel _$LastInvoiceModelFromJson(Map<String, dynamic> json) =>
    LastInvoiceModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: LastInvoiceData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LastInvoiceModelToJson(LastInvoiceModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

LastInvoiceData _$LastInvoiceDataFromJson(Map<String, dynamic> json) =>
    LastInvoiceData(
      invoiceNumber: json['invoice_number'] as String,
      invoicePrice: json['invoice_price'] as String,
      status: json['status'] as String,
      expiresAt: json['expires_at'] as String,
      user: InvoiceUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LastInvoiceDataToJson(LastInvoiceData instance) =>
    <String, dynamic>{
      'invoice_number': instance.invoiceNumber,
      'invoice_price': instance.invoicePrice,
      'status': instance.status,
      'expires_at': instance.expiresAt,
      'user': instance.user,
    };

InvoiceUser _$InvoiceUserFromJson(Map<String, dynamic> json) => InvoiceUser(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  username: json['username'] as String,
);

Map<String, dynamic> _$InvoiceUserToJson(InvoiceUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
    };
