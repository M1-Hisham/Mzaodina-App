import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_constants.dart';
import 'package:mzaodina_app/feature/auth/login/view-model/data/model/login_request_body.dart';
import 'package:mzaodina_app/feature/auth/login/view-model/data/model/login_response_model.dart';
import 'package:mzaodina_app/feature/profile/data/model/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

/// This is the API service class that handles all the API calls.
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(
    Dio dio, {
    ParseErrorLogger? errorLogger,
    String? baseUrl,
  }) = _ApiService;

  // =================== Auth ===================
  /// service for login
  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestBody loginRequestBody,);

  /// service for logout
  @POST(ApiConstants.logout)
  Future<void> logout();

  /// service for ProfileUserData
  @POST(ApiConstants.profileUserData)
  Future<UserModel> profileUserData();
}
