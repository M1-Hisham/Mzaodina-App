part of 'auction_terms_cubit.dart';

sealed class AuctionTermsState {}

final class AuctionTermsInitial extends AuctionTermsState {}

final class AuctionTermsLoading extends AuctionTermsState {}

final class AuctionTermsSuccess extends AuctionTermsState {
  final InfoResponse data;

  AuctionTermsSuccess(this.data);
}

final class AuctionTermsError extends AuctionTermsState {
  final String message;

  AuctionTermsError(this.message);
}
