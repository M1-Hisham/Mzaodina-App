part of 'qadim_cubit.dart';

sealed class QadimState {}

final class QadimInitial extends QadimState {}

final class QadimLoading extends QadimState {}

final class QadimSuccess extends QadimState {
  final QadimAuctionResponse data;

  QadimSuccess(this.data);
}

final class QadimError extends QadimState {
  final String errorMessage;

  QadimError(this.errorMessage);
}
