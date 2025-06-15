import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/ongoing_show_auction_model.dart';

class OngoingShowAuctionRepo {
  final ApiService apiService;

  OngoingShowAuctionRepo(this.apiService);

  Future<Either<Failure, OngoingShowAuctionModel>> getongoingShowAuctions(
    String slug,
  ) async {
    try {
      final response = await apiService.getOngoingShowAuction(slug);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
