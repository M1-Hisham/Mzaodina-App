import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/model/jaraa_auction_response.dart';

class JaraaAuctionRepo {
  final ApiService apiService;

  JaraaAuctionRepo(this.apiService);

  Future<Either<Failure, JaraaAuctionResponse>> getOngoingAuctions() async {
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
