abstract class ProfileCubitState {}

class ProfileInitial extends ProfileCubitState {}

class ProfileLogoutLoading extends ProfileCubitState {}

class ProfileLogoutSuccess extends ProfileCubitState {}

class ProfileLogoutError extends ProfileCubitState {
  final String message;
  ProfileLogoutError(this.message);
}