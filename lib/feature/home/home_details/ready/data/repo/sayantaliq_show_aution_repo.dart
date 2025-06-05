import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/sayantaliq_show_auction_mode.dart';

class ReadyShowAutionRepo {
  final ApiService apiService;
  ReadyShowAutionRepo(this.apiService);

  Future<Either<Failure, ReadyShowAuctionMode>> getReadyShowAuction(
    String slug,
  ) async {
    try {
      final response = await apiService.getReadyShowAuction(slug);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
