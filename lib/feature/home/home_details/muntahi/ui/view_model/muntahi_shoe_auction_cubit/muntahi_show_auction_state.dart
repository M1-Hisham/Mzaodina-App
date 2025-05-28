part of 'muntahi_show_auction_cubit.dart';

sealed class MuntahiShowAuctionState {}

final class MuntahiShowAuctionInitial extends MuntahiShowAuctionState {}

final class MuntahiShowAuctionLoading extends MuntahiShowAuctionState {}

final class MuntahiShowAuctionSuccess extends MuntahiShowAuctionState {
  final MuntahiShowAuctionModel model;

  MuntahiShowAuctionSuccess(this.model);
}

final class MuntahiShowAuctionError extends MuntahiShowAuctionState {
  final String message;

  MuntahiShowAuctionError(this.message);
}
