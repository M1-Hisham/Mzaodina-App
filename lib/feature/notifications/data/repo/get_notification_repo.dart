import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/notifications/data/model/get_all_notification_model.dart';
import 'package:mzaodina_app/core/api/api_service.dart';

class GetNotificationRepo {
  final ApiService apiService;

  GetNotificationRepo(this.apiService);

  Future<Either<Failure, GetAllNotificationModel>> getNotifications() async {
    try {
      final response = await apiService.getUserNotifications();
      return Right(response);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
