import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/model/qadim_auction_response.dart';

class QadimAuctionRepo {
  final ApiService apiService;

  QadimAuctionRepo(this.apiService);

  Future<Either<Failure, QadimAuctionResponse>> getNotStartAuctions() async {
    try {
      final response = await apiService.getNotStartAuctions();
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
