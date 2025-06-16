part of 'ready_cubit.dart';

sealed class ReadyState {}

final class ReadyInitial extends ReadyState {}

final class ReadyLoading extends ReadyState {}

final class ReadySuccess extends ReadyState {
  final HomeDetailsModel data;

  ReadySuccess(this.data);
}

final class ReadyError extends ReadyState {
  final String errorMessage;

  ReadyError(this.errorMessage);
}

class FilterState extends ReadyState {}
