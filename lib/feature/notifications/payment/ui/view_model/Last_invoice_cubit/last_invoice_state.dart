part of 'last_invoice_cubit.dart';

sealed class LastInvoiceState {}

final class LastInvoiceInitial extends LastInvoiceState {}

final class LastInvoiceLoading extends LastInvoiceState {}

final class LastInvoiceSuccess extends LastInvoiceState {
  final LastInvoiceModel lastInvoiceModel;

  LastInvoiceSuccess(this.lastInvoiceModel);
}

final class LastInvoiceError extends LastInvoiceState {
  final String message;

  LastInvoiceError(this.message);
}
