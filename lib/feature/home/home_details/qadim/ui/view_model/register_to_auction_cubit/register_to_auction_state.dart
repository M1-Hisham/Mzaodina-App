part of 'register_to_auction_cubit.dart';

sealed class RegisterToAuctionState {}

final class RegisterToAuctionInitial extends RegisterToAuctionState {}

final class RegisterToAuctionLoading extends RegisterToAuctionState {}

final class RegisterToAuctionSuccess extends RegisterToAuctionState {
  final RegisterToAutionModel registerToAutionModel;

  RegisterToAuctionSuccess(this.registerToAutionModel);
}

final class RegisterToAuctionError extends RegisterToAuctionState {
  final String message;

  RegisterToAuctionError(this.message);
}
