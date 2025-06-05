part of 'sayantaliq_show_austion_cubit.dart';

sealed class SayantaliqShowAustionState {}

final class SayantaliqShowAustionInitial extends SayantaliqShowAustionState {}

final class SayantaliqShowAustionLoading extends SayantaliqShowAustionState {}

final class SayantaliqShowAustionSuccess extends SayantaliqShowAustionState {
  final SayantaliqShowAuctionMode sayantaliqShowAuctionMode;

  SayantaliqShowAustionSuccess(this.sayantaliqShowAuctionMode);
}

final class SayantaliqShowAustionErorr extends SayantaliqShowAustionState {
  final String error;

  SayantaliqShowAustionErorr(this.error);
}
