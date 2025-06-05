part of 'sayantaliq_cubit.dart';

sealed class SayantaliqState {}

final class SayantaliqInitial extends SayantaliqState {}

final class SayantaliqLoading extends SayantaliqState {}

final class SayantaliqSuccess extends SayantaliqState {
  final SayantaliqAuctionResponse data;

  SayantaliqSuccess(this.data);
}

final class SayantaliqError extends SayantaliqState {
  final String errorMessage;

  SayantaliqError(this.errorMessage);
}
