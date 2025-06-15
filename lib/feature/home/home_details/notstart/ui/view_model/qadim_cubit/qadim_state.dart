part of 'qadim_cubit.dart';

sealed class NotstartState {}

final class NotstartInitial extends NotstartState {}

final class NotstartLoading extends NotstartState {}

final class NotstartSuccess extends NotstartState {
  final NotstartAuctionResponse data;

  NotstartSuccess(this.data);
}

final class NotstartError extends NotstartState {
  final String errorMessage;

  NotstartError(this.errorMessage);
}

class FilterState extends NotstartState {}
