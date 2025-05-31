import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/notifications/data/model/mark_notification.dart';

class MarkNotifacationRepo {
  final ApiService apiService;

  MarkNotifacationRepo(this.apiService);

  Future<Either<Failure, MarkNotificationModel>> markAllNotificatiom() async {
    try {
      final response = await apiService.markAllReadNotifications();
      log("✅ FCM Token sent successfully!");
      return Right(response);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MarkNotificationModel>> markAsReadNotificatiom({
    required String id,
  }) async {
    try {
      final response = await apiService.markAsReadNotifications(id);
      log("✅ FCM Token sent successfully!");
      return Right(response);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
