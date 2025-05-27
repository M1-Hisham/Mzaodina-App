import 'package:mzaodina_app/feature/auth/login/data/model/login_response_model.dart';

abstract class GoogleCubitState {}

class LoginInitial extends GoogleCubitState {}

class LoginLoading extends GoogleCubitState {}

class LoginSuccess extends GoogleCubitState {
  final LoginResponseModel response;
  LoginSuccess(this.response);
}

class LoginError extends GoogleCubitState {
  final String message;
  LoginError(this.message);
}
