import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/jaraa_show_auction_model.dart';

class JaraaShowAuctionRepo {
  final ApiService apiService;

  JaraaShowAuctionRepo(this.apiService);

  Future<Either<Failure, JaraaShowAuctionModel>> getjaraaShowAuctions(
    String slug,
  ) async {
    try {
      final response = await apiService.getJaraaShowAuction(slug);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
