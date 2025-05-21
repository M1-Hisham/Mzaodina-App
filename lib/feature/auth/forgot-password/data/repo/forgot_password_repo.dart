import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/data/model/forgot_password_response.dart';

class ForgotPasswordRepo {
  final ApiService apiService;

  ForgotPasswordRepo(this.apiService);

  Future<Either<Failure, ForgotPasswordResponse>> forgotPassword(
    String queryParams,
  ) async {
    try {
      final response = await apiService.forgotPassword(queryParams);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
