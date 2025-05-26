part of 'show_action_cubit.dart';

sealed class ShowActionState {}

final class ShowActionInitial extends ShowActionState {}

final class ShowActionLoading extends ShowActionState {}

final class ShowActionSuccess extends ShowActionState {
  final ShowAuctionModel showActionModel;

  ShowActionSuccess(this.showActionModel);
}

final class ShowActionError extends ShowActionState {
  final String message;

  ShowActionError(this.message);
}
