part of 'sayantaliq_cubit.dart';

sealed class ReadyState {}

final class ReadyInitial extends ReadyState {}

final class ReadyLoading extends ReadyState {}

final class ReadySuccess extends ReadyState {
  final ReadyAuctionResponse data;

  ReadySuccess(this.data);
}

final class ReadyError extends ReadyState {
  final String errorMessage;

  ReadyError(this.errorMessage);
}
