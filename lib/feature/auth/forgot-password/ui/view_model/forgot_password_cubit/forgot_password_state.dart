part of 'forgot_password_cubit.dart';

sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordLoading extends ForgotPasswordState {}

final class ForgotPasswordSuccess extends ForgotPasswordState {
  final String message;

  ForgotPasswordSuccess(this.message);
}

final class ForgotPasswordFailure extends ForgotPasswordState {
  final String errorMessage;

  ForgotPasswordFailure(this.errorMessage);
}
