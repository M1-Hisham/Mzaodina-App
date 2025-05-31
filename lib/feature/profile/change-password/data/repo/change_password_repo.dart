import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/profile/change-password/data/model/change_password_model.dart';
import 'package:mzaodina_app/feature/profile/data/model/password_update_response.dart';

class ChangePasswordRepo {
  final ApiService apiService;

  ChangePasswordRepo(this.apiService);

  Future<Either<Failure, PasswordUpdateResponse>> changePassword(
    ChangePasswordModel body,
  ) async {
    try {
      final response = await apiService.changePassword(body);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
