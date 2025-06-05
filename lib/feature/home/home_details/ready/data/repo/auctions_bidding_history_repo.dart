import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/auctions_bidding_history_model.dart';

class AuctionsBiddingHistoryRepo {
  final ApiService apiService;

  AuctionsBiddingHistoryRepo(this.apiService);

  Future<Either<Failure, AuctionsBiddingHistoryModel>>
  getAuctionsBiddingHistory(String slug) async {
    try {
      final response = await apiService.auctionsBiddingHistory(slug);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
