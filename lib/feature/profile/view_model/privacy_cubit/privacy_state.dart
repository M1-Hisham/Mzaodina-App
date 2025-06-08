part of 'privacy_cubit.dart';

sealed class PrivacyState {}

final class PrivacyInitial extends PrivacyState {}

final class PrivacyLoading extends PrivacyState {}

final class PrivacySuccess extends PrivacyState {
  final InfoResponse data;

  PrivacySuccess(this.data);
}

final class PrivacyError extends PrivacyState {
  final String message;

  PrivacyError(this.message);
}
