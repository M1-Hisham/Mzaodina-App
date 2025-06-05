import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/model/muntahi_auctions_response.dart';

class FinishedAuctionRepo {
  final ApiService apiService;

  FinishedAuctionRepo(this.apiService);

  Future<Either<Failure, FinishedAuctionsResponse>>
  getFinishedAuctions() async {
    try {
      final response = await apiService.getFinishedAuctions();
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
