part of 'ongoing_show_auction_cubit.dart';

sealed class OngoingShowAuctionState {}

final class OngoingShowAuctionInitial extends OngoingShowAuctionState {}

final class OngoingShowAuctionLoading extends OngoingShowAuctionState {}

final class OngoingShowAuctionSuccess extends OngoingShowAuctionState {
  final OngoingShowAuctionModel ongoingShowAuctionMode;

  OngoingShowAuctionSuccess(this.ongoingShowAuctionMode);
}

final class OngoingShowAuctionErorr extends OngoingShowAuctionState {
  final String error;

  OngoingShowAuctionErorr(this.error);
}
