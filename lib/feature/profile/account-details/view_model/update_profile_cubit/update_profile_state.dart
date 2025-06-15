part of 'update_profile_cubit.dart';

sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileLoading extends UpdateProfileState {}

final class UpdateProfileSuccess extends UpdateProfileState {
  final UserModel userModel;
  UpdateProfileSuccess(this.userModel);
}

final class UpdateProfileError extends UpdateProfileState {
  final String errMessage;
   final Failure? failure;
  UpdateProfileError(this.errMessage,{this.failure});
}
