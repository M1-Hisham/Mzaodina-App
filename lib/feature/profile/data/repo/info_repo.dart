import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/profile/data/model/info_response.dart';

class InfoRepo {
  final ApiService apiService;

  InfoRepo(this.apiService);

  Future<Either<Failure, InfoResponse>> getAboutUs() async {
    try {
      final result = await apiService.aboutUs();
      return Right(result);
    } on DioException catch (dioError) {
      log('DioException in getAboutUs: ${dioError.message}');
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      log('Unknown error in getAboutUs: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, InfoResponse>> getAuctionTerms() async {
    try {
      final result = await apiService.auctionTerms();
      return Right(result);
    } on DioException catch (dioError) {
      log('DioException in getAuctionTerms: ${dioError.message}');
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      log('Unknown error in getAuctionTerms: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, InfoResponse>> getPrivacy() async {
    try {
      final result = await apiService.privacy();
      return Right(result);
    } on DioException catch (dioError) {
      log('DioException in getPrivacy: ${dioError.message}');
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      log('Unknown error in getPrivacy: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, InfoResponse>> getTerms() async {
    try {
      final result = await apiService.terms();
      return Right(result);
    } on DioException catch (dioError) {
      log('DioException in getTerms: ${dioError.message}');
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      log('Unknown error in getTerms: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, InfoResponse>> getShippingAndReturn() async {
    try {
      final result = await apiService.shippingAndReturn();
      return Right(result);
    } on DioException catch (dioError) {
      log('DioException in getShippingAndReturn: ${dioError.message}');
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      log('Unknown error in getShippingAndReturn: $e');
      return Left(ServerFailure(e.toString()));
    }
  }
}
