import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/sayantaliq_show_auction_mode.dart';

class SayantaliqShowAutionRepo {
  final ApiService apiService;
  SayantaliqShowAutionRepo(this.apiService);

  Future<Either<Failure, SayantaliqShowAuctionMode>> getSayantaliqShowAuction(
    String slug,
  ) async {
    try {
      final response = await apiService.getSayantaliqShowAuction(slug);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
