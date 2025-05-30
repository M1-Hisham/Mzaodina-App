import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/feature/notifications/payment/data/model/last_invoice_model.dart';

class LastInvoiceRepo {
  final ApiService apiService;

  LastInvoiceRepo(this.apiService);

  Future<Either<Failure, LastInvoiceModel>> lastInvoiceChecker() async {
    try {
      final response = await apiService.lastInvoiceChecker();
      return Right(response);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
