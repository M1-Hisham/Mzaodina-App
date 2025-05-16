part of 'user_data_cubit.dart';

sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class UserDataLoading extends UserDataState {}

final class UserDataSuccess extends UserDataState {
  final UserModel userModel;
  UserDataSuccess(this.userModel);
}

final class UserDataError extends UserDataState {
  final String errMessage;
  UserDataError(this.errMessage);
}
