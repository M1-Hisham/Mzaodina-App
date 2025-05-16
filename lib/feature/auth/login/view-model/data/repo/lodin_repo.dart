import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/constant/shared_preferences_key.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/core/helper/shaerd_pref_helper.dart';
import 'package:mzaodina_app/feature/auth/login/view-model/data/model/login_request_body.dart';
import 'package:mzaodina_app/feature/auth/login/view-model/data/model/login_response_model.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);

  Future<Either<Failure, LoginResponseModel>> login(
    LoginRequestBody body,
  ) async {
    try {
      final response = await apiService.login(body);

      if (response.accessToken != null && response.accessToken!.isNotEmpty) {
        await SharedPrefHelper.setSecuredString(
          SharedPreferencesKeys.authToken,
          response.accessToken!,
        );
        log("Token saved successfully!");
      }

      return Right(response);
    } catch (e) {
      log("Login error: $e");
      return Left(ServerFailure(e.toString()));
    }
  }
}
