part of 'ready_show_austion_cubit.dart';

sealed class ReadyShowAustionState {}

final class ReadyShowAustionInitial extends ReadyShowAustionState {}

final class ReadyShowAustionLoading extends ReadyShowAustionState {}

final class ReadyShowAustionSuccess extends ReadyShowAustionState {
  final ReadyShowAuctionMode readyShowAuctionMode;

  ReadyShowAustionSuccess(this.readyShowAuctionMode);
}

final class ReadyShowAustionErorr extends ReadyShowAustionState {
  final String error;

  ReadyShowAustionErorr(this.error);
}
