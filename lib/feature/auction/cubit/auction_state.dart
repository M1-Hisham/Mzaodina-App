part of 'auction_cubit.dart';

@immutable
abstract class AuctionState {}

class AuctionStateInitialStates extends AuctionState {}

class AuctionLoadingStates extends AuctionState {}

class AuctionSuccessStates extends AuctionState {
  final MaxBid auctionStatusModel;

  AuctionSuccessStates({required this.auctionStatusModel});
}

class AuctionErrorStates extends AuctionState {
  final String error;

  AuctionErrorStates({required this.error});
}

class AuctionEventLoadingStates extends AuctionState {}

class AuctionEventSuccessStates extends AuctionState {
  // final AuctionModel auctionStatusModel;

  // AuctionEventSuccessStates({required this.auctionStatusModel});
}

class AuctionEventErrorStates extends AuctionState {
  final String error;

  AuctionEventErrorStates({required this.error});
}

class AuctionChangeDateStates extends AuctionState {}
