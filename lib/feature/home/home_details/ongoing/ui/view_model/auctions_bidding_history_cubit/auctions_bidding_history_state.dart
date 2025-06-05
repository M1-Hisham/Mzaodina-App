part of 'auctions_bidding_history_cubit.dart';

sealed class AuctionsBiddingHistoryState {}

final class AuctionsBiddingHistoryInitial extends AuctionsBiddingHistoryState {}

final class AuctionsBiddingHistoryLoading extends AuctionsBiddingHistoryState {}

final class AuctionsBiddingHistorySuccess extends AuctionsBiddingHistoryState {
  final AuctionsBiddingHistoryModel auctionsBiddingHistoryModel;

  AuctionsBiddingHistorySuccess(this.auctionsBiddingHistoryModel);
}

final class AuctionsBiddingHistoryError extends AuctionsBiddingHistoryState {
  final String error;

  AuctionsBiddingHistoryError(this.error);
}
