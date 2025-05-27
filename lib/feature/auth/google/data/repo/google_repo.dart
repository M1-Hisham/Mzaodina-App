import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/constant/shared_preferences_key.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/core/helper/shaerd_pref_helper.dart';
import 'package:mzaodina_app/feature/auth/login/data/model/login_response_model.dart';

class GoogleRepo {
  final ApiService apiService;
  GoogleRepo(this.apiService);

  Future<Either<Failure, LoginResponseModel>> googleRepo(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await apiService.googleLogin(body);
      if (response.accessToken != null && response.accessToken!.isNotEmpty) {
        await SharedPrefHelper.setSecuredString(
          SharedPreferencesKeys.authToken,
          response.accessToken!,
        );
        log("Token saved successfully!");
      }
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
