part of 'jaraa_show_auction_cubit.dart';

sealed class JaraaShowAuctionState {}

final class JaraaShowAuctionInitial extends JaraaShowAuctionState {}

final class JaraaShowAuctionLoading extends JaraaShowAuctionState {}

final class JaraaShowAuctionSuccess extends JaraaShowAuctionState {
  final JaraaShowAuctionModel jaraaShowAuctionMode;

  JaraaShowAuctionSuccess(this.jaraaShowAuctionMode);
}

final class JaraaShowAuctionErorr extends JaraaShowAuctionState {
  final String error;

  JaraaShowAuctionErorr(this.error);
}
