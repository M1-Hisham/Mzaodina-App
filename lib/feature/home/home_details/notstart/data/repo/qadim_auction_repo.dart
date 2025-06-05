import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/qadim_auction_response.dart';

class NotstartAuctionRepo {
  final ApiService apiService;

  NotstartAuctionRepo(this.apiService);

  Future<Either<Failure, NotstartAuctionResponse>> getNotStartAuctions() async {
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
