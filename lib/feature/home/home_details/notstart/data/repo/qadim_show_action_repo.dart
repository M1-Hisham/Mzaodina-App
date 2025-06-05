import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/qadim_show_action_model.dart';

class NotstartShowActionRepo {
  final ApiService apiService;

  NotstartShowActionRepo(this.apiService);

  Future<Either<Failure, NotstartShowAuctionModel>> getShowActionRepo(
    String slug,
  ) async {
    try {
      final response = await apiService.getNotstartShowAuction(slug);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
