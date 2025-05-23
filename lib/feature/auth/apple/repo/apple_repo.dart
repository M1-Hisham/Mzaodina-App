
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';

class AppleRepo {

  final ApiService apiService;
  AppleRepo(this.apiService);
  
  Future<Failure?> appleLogin(
    Map<String, dynamic> body,
  ) async {
    try {
      await apiService.appleLogin(body);
      return null; // No failure occurred
    } on DioException catch (dioError) {
      return ServerFailure.fromDioError(dioError);
    } catch (e) {
      return ServerFailure(e.toString());
    }
  }
}