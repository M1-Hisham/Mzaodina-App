import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/notifications/payment/data/model/last_invoice_model.dart';
import 'package:mzaodina_app/feature/notifications/payment/data/repo/last_invoice_repo.dart';

part 'last_invoice_state.dart';

class LastInvoiceCubit extends Cubit<LastInvoiceState> {
  LastInvoiceCubit(this.lastInvoiceRepo) : super(LastInvoiceInitial());
  final LastInvoiceRepo lastInvoiceRepo;
  Future<void> lastInvoiceChecker() async {
    emit(LastInvoiceLoading());
    final result = await lastInvoiceRepo.lastInvoiceChecker();
    result.fold(
      (failure) => emit(LastInvoiceError(failure.errMessage)),
      (lastInvoiceModel) => emit(LastInvoiceSuccess(lastInvoiceModel)),
    );
  }
}
