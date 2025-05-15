import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_constants.dart';
import 'package:mzaodina_app/core/helper/shaerd_pref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// This is the Dio factory class that handles all the Dio configurations.
class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;
  static const String baseUrl = ApiConstants.baseUrl;

  static Future<Dio> getDio() async {
    if (dio == null) {
      dio = Dio(BaseOptions(baseUrl: baseUrl, followRedirects: true));

      await addDioHeaders();
      addDioInterceptor();
    }
    return dio!;
  }

  static Future<void> addDioHeaders() async {
    final String? token = await SharedPrefHelper.getSecuredString('auth_token');

    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token ?? ''}',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final String? token = await SharedPrefHelper.getSecuredString(
            'auth_token',
          );
          log("Token: $token");
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
            log("Token added to headers");
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          if (e.response?.statusCode == 401) {
            log("Unauthorized error: Token might be expired.");
          }
          if (e.response?.statusCode == 403) {
            log(
              "Forbidden error: You don't have permission to access this resource.",
            );
          }
          if (e.response?.statusCode == 500) {
            log("Server error: Something went wrong on the server.");
          }
          if (e.response?.statusCode == 404) {
            log("Not found error: The requested resource was not found.");
          }
          if (e.response?.statusCode == 400) {
            log("Bad request error: The request was invalid.");
          }
          return handler.next(e);
        },
      ),
    );
    dio?.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: false,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }
}
