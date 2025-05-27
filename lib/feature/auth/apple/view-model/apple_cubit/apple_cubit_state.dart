import 'package:mzaodina_app/feature/auth/login/data/model/login_response_model.dart';

abstract class AppleCubitState {}

class LoginInitial extends AppleCubitState {}

class LoginLoading extends AppleCubitState {}

class LoginSuccess extends AppleCubitState {
  final LoginResponseModel response;
  LoginSuccess(this.response);
}

class LoginError extends AppleCubitState {
  final String message;
  LoginError(this.message);
}
