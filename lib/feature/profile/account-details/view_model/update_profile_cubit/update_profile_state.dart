part of 'update_profile_cubit.dart';

sealed class UpdateProfileState {}

final class UserDataInitial extends UpdateProfileState {}

final class UserDataLoading extends UpdateProfileState {}

final class UserDataSuccess extends UpdateProfileState {
  final UserModel userModel;
  UserDataSuccess(this.userModel);
}

final class UserDataError extends UpdateProfileState {
  final String errMessage;
  UserDataError(this.errMessage);
}

class UserDataNotLoggedIn extends UpdateProfileState {}
