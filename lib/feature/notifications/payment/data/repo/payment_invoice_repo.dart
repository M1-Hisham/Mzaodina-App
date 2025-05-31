import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/feature/notifications/payment/data/model/payment_invoice_model.dart';

class PaymentInvoiceRepo {
  final ApiService apiService;

  PaymentInvoiceRepo(this.apiService);

  Future<Either<Failure, PaymentInvoiceModel>> paymentInvoice(
    String invoiceId,
  ) async {
    try {
      final response = await apiService.paymentInvoice({
        "invoice_id": invoiceId,
      });
      return Right(response);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
