part of 'muntahi_show_auction_cubit.dart';

sealed class FinishedShowAuctionState {}

final class FinishedShowAuctionInitial extends FinishedShowAuctionState {}

final class FinishedShowAuctionLoading extends FinishedShowAuctionState {}

final class FinishedShowAuctionSuccess extends FinishedShowAuctionState {
  final FinishedShowAuctionModel model;

  FinishedShowAuctionSuccess(this.model);
}

final class FinishedShowAuctionError extends FinishedShowAuctionState {
  final String message;

  FinishedShowAuctionError(this.message);
}
