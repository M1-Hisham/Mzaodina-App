part of 'notstart_show_action_cubit.dart';

sealed class NotstartShowActionState {}

final class NotstartShowActionInitial extends NotstartShowActionState {}

final class NotstartShowActionLoading extends NotstartShowActionState {}

final class NotstartShowActionSuccess extends NotstartShowActionState {
  final NotstartShowAuctionModel showActionModel;

  NotstartShowActionSuccess(this.showActionModel);
}

final class NotstartShowActionError extends NotstartShowActionState {
  final String message;

  NotstartShowActionError(this.message);
}
