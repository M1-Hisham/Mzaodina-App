import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/profile/data/model/user_model.dart';

class UserDataRepo {
  final ApiService apiService;

  UserDataRepo(this.apiService);

  Future<Either<Failure, UserModel>> profileUserData() async {
    try {
      final profileUserData =  await apiService.profileUserData();
      return right(profileUserData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
