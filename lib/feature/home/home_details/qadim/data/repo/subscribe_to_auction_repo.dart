import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/model/subscribe_aution_body.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/model/subscribe_to_aution_model.dart';

class SubscribeToAuctionRepo {
  final ApiService apiService;

  SubscribeToAuctionRepo(this.apiService);
  Future<Either<Failure, SubscribeToAutionModel>> subscribeToAutionModel(
    SubscribeAutionBody subscribeAutionBody,
  ) async {
    try {
      final response = await apiService.subscribeAuctions(subscribeAutionBody);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
