import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/data/model/actions_count_model.dart';

class ActionsCountRepo {
  final ApiService apiService;

  ActionsCountRepo(this.apiService);

  Future<Either<Failure, ActionsCountModel>> getActionsCount() async {
    try {
      final result = await apiService.getAuctionsCount();
      return Right(result);
    } on DioException catch (dioError) {
      log('DioException fetching actions count: ${dioError.message}');
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      log('Error fetching actions count: $e');
      return Left(ServerFailure(e.toString()));
    }
  }
}
