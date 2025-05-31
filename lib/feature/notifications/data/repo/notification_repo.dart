import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/notifications/data/model/save_token_responce_model.dart';

class NotificationRepo {
  final ApiService apiService;

  NotificationRepo(this.apiService);

  Future<Either<Failure, SaveTokenResponceModel>> saveFcmToken({
    required String token,
    String provider = 'fcm-mobile',
  }) async {
    try {
      final response = await apiService.saveFcmToken(token, provider);
      log("✅ FCM Token sent successfully!");
      return Right(response);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
