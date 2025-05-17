part of 'change_password_cubit.dart';

sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordSuccess extends ChangePasswordState {
  final String message;

  ChangePasswordSuccess(this.message);
}

final class ChangePasswordFailure extends ChangePasswordState {
  final String errorMessage;

  ChangePasswordFailure(this.errorMessage);
}
