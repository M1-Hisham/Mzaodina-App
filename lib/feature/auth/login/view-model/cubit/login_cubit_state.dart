import 'package:mzaodina_app/feature/auth/login/view-model/data/model/login_response_model.dart';

abstract class LoginCubitState {}

class LoginInitial extends LoginCubitState {}

class LoginLoading extends LoginCubitState {}

class LoginSuccess extends LoginCubitState {
  final LoginResponseModel response;
  LoginSuccess(this.response);
}

class LoginError extends LoginCubitState {
  final String message;
  LoginError(this.message);
}
