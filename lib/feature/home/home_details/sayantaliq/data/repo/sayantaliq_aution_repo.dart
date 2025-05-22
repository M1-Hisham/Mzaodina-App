import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/data/model/sayantaliq_auction_response.dart';

class SayantaliqAutionRepo {
  final ApiService apiService;

  SayantaliqAutionRepo(this.apiService);

  Future<Either<Failure, SayantaliqAuctionResponse>>
  getFinishedAuctions() async {
    try {
      final response = await apiService.getReadyAuctions();
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
