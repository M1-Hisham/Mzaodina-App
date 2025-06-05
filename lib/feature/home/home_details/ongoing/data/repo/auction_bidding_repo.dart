import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/auctions_bidding_body.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/bidding_response_model.dart';

class AuctionBiddingRepo {
  final ApiService apiService;

  AuctionBiddingRepo(this.apiService);

  Future<Either<Failure, AuctionBiddingResponseModel>> getAuctionBidding(
    AuctionsBiddingBody auctionsBiddingBody,
  ) async {
    try {
      final response = await apiService.auctionsBidding(auctionsBiddingBody);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
