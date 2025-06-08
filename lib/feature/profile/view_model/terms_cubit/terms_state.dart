part of 'terms_cubit.dart';

sealed class TermsState {}

final class TermsInitial extends TermsState {}

final class TermsLoading extends TermsState {}

final class TermsSuccess extends TermsState {
  final InfoResponse data;

  TermsSuccess(this.data);
}

final class TermsError extends TermsState {
  final String message;

  TermsError(this.message);
}
