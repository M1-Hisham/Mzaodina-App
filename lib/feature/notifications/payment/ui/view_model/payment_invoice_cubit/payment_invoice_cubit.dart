import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/notifications/payment/data/model/payment_invoice_model.dart';
import 'package:mzaodina_app/feature/notifications/payment/data/repo/payment_invoice_repo.dart';

part 'payment_invoice_state.dart';

class PaymentInvoiceCubit extends Cubit<PaymentInvoiceState> {
  PaymentInvoiceCubit(this.paymentInvoiceRepo) : super(PaymentInvoiceInitial());
  final PaymentInvoiceRepo paymentInvoiceRepo;
  Future<void> paymentInvoice(String invoiceId) async {
    emit(PaymentInvoiceLoading());
    final result = await paymentInvoiceRepo.paymentInvoice(invoiceId);
    result.fold(
      (failure) => emit(PaymentInvoiceError(failure.errMessage)),
      (paymentInvoiceModel) => emit(PaymentInvoiceSuccess(paymentInvoiceModel)),
    );
  }
}
