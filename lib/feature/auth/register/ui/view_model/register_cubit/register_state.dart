part of 'register_cubit.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final LoginResponseModel response;
  RegisterSuccess(this.response);
}

class RegisterError extends RegisterState {
  final String message;
  RegisterError(this.message);
}
