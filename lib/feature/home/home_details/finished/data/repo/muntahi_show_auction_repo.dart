import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/model/muntahi_show_auction_model.dart';

class FinishedShowAuctionRepo {
  final ApiService apiService;

  FinishedShowAuctionRepo(this.apiService);

  Future<Either<Failure, FinishedShowAuctionModel>> getFinishedShowAuction(
    String slug,
  ) async {
    try {
      final response = await apiService.getFinishedShowAuction(slug);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
