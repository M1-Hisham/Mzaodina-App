import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/jaraa_auction_response.dart';

class OngoingAuctionRepo {
  final ApiService apiService;

  OngoingAuctionRepo(this.apiService);

  Future<Either<Failure, OngoingAuctionResponse>> getOngoingAuctions() async {
    try {
      final response = await apiService.getOngoingAuctions();
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
