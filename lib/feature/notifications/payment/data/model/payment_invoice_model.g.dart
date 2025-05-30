// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentInvoiceModel _$PaymentInvoiceModelFromJson(Map<String, dynamic> json) =>
    PaymentInvoiceModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: PaymentInvoiceData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentInvoiceModelToJson(
  PaymentInvoiceModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

PaymentInvoiceData _$PaymentInvoiceDataFromJson(Map<String, dynamic> json) =>
    PaymentInvoiceData(url: json['url'] as String);

Map<String, dynamic> _$PaymentInvoiceDataToJson(PaymentInvoiceData instance) =>
    <String, dynamic>{'url': instance.url};
