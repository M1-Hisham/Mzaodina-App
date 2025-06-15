import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/notstart_auction_response.dart';

class NotstartAuctionRepo {
  final ApiService apiService;

  NotstartAuctionRepo(this.apiService);

  Future<Either<Failure, NotstartAuctionResponse>> getNotStartAuctions(
    int page,
  ) async {
    try {
      final response = await apiService.getNotStartAuctions(page: page);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
