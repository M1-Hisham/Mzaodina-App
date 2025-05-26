import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/model/register_to_aution_model.dart';

class RegisterToAuctionRepo {
  final ApiService apiService;

  RegisterToAuctionRepo(this.apiService);
  Future<Either<Failure, RegisterToAutionModel>> getOngoingAuctions(
    String slug,
  ) async {
    try {
      final response = await apiService.registerAuctions(slug);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
