import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/home/data/model/tap_checkout_url_model.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/model/subscribe_aution_body.dart';

class SubscribeAuctionRepo {
  final ApiService apiService;

  SubscribeAuctionRepo(this.apiService);
  Future<Either<Failure, TapCheckoutUrlModel>> subscribeToAutionModel(
    SubscribeAutionBody subscribeAutionBody,
  ) async {
    try {
      final response = await apiService.subscribe(subscribeAutionBody);
      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
