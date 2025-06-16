import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/data/model/home_details_model.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/ready_auction_response.dart';

class ReadyAutionRepo {
  final ApiService apiService;

  ReadyAutionRepo(this.apiService);

  Future<Either<Failure, HomeDetailsModel>> getReadyAuctions(
    int page,
  ) async {
    try {
      final response = await apiService.getReadyAuctions(page: page);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
