import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/data/model/show_action_model.dart';

class ShowActionRepo {
  final ApiService apiService;

  ShowActionRepo(this.apiService);

  Future<Either<Failure, ShowAuctionModel>> getShowActionRepo(
    String slug,
  ) async {
    try {
      final response = await apiService.getShowAuction(slug);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
