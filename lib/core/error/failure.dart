import 'package:dio/dio.dart';

/// Base Failure Class
abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

/// Server Failure Class for handling Dio Errors
class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  /// Factory constructor to generate failure from DioException
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with the server.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with the server.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with the server.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to the server was cancelled.');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection.');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Oops! There was an error, Please try again.');
    }
  }

  /// Factory constructor to handle server response errors
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (response is Map<String, dynamic>) {
        if (response.containsKey('error')) {
          return ServerFailure(response['error']);
        } else if (response.containsKey('message') &&
            response['message'] is String) {
          return ServerFailure(response['message']);
        } else if (response.containsKey('message') &&
            response.containsKey('errors')) {
          final errors = response['errors'] as Map<String, dynamic>;
          String combinedErrors = errors.entries
              .map((entry) => '${entry.key}: ${entry.value.join(", ")}')
              .join(" \n\n ");
          return ServerFailure('${response['message']}  $combinedErrors');
        }
      }
      return ServerFailure('Unknown Error');
    } else if (statusCode == 422) {
      if (response is Map<String, dynamic> && response.containsKey('errors')) {
        final errors = response['errors'] as Map<String, dynamic>;
        String combinedErrors = errors.entries
            .map((entry) => '${entry.value.join("\n\n ")}')
            .join(" \n\n ");
        return ServerFailure(' $combinedErrors');
        // return ServerFailure('${response['message']}  $combinedErrors');
      }
      return ServerFailure(
        response['message'] ?? 'Unprocessable Content Error',
      );
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Oops! There was an Error, Please try again.');
    }
  }
}
