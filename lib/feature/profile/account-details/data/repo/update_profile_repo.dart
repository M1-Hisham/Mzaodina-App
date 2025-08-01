import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/profile/account-details/data/model/update_profile_body.dart';
import 'package:mzaodina_app/feature/profile/data/model/user_model.dart';

class UpdateProfileRepo {
  final ApiService apiService;
  UpdateProfileRepo(this.apiService);

  Future<Either<Failure, UserModel>> profileUpdate(
    UpdateProfileBody updateProfileBody,
  ) async {
    try {
      final profileUserData = await apiService.profileUpdate(updateProfileBody);
      return right(profileUserData);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
