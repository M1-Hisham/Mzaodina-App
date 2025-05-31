part of 'payment_invoice_cubit.dart';

sealed class PaymentInvoiceState {}

final class PaymentInvoiceInitial extends PaymentInvoiceState {}

final class PaymentInvoiceLoading extends PaymentInvoiceState {}

final class PaymentInvoiceSuccess extends PaymentInvoiceState {
  final PaymentInvoiceModel paymentInvoiceModel;

  PaymentInvoiceSuccess(this.paymentInvoiceModel);
}

final class PaymentInvoiceError extends PaymentInvoiceState {
  final String message;

  PaymentInvoiceError(this.message);
}
