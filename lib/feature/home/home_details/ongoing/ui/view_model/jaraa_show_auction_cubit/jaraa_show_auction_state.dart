part of 'jaraa_show_auction_cubit.dart';

sealed class OngoingShowAuctionState {}

final class OngoingShowAuctionInitial extends OngoingShowAuctionState {}

final class OngoingShowAuctionLoading extends OngoingShowAuctionState {}

final class OngoingShowAuctionSuccess extends OngoingShowAuctionState {
  final OngoingShowAuctionModel jaraaShowAuctionMode;

  OngoingShowAuctionSuccess(this.jaraaShowAuctionMode);
}

final class OngoingShowAuctionErorr extends OngoingShowAuctionState {
  final String error;

  OngoingShowAuctionErorr(this.error);
}
