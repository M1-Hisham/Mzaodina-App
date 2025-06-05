part of 'muntahi_cubit.dart';

sealed class MuntahiState {}

final class MuntahiInitial extends MuntahiState {}

final class MuntahiLoading extends MuntahiState {}

final class MuntahiSuccess extends MuntahiState {
  final MuntahiAuctionsResponse data;

  MuntahiSuccess(this.data);
}

final class MuntahiError extends MuntahiState {
  final String errorMessage;

  MuntahiError(this.errorMessage);
}
