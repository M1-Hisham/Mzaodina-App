part of 'qadim_show_action_cubit.dart';

sealed class QadimShowActionState {}

final class QadimShowActionInitial extends QadimShowActionState {}

final class QadimShowActionLoading extends QadimShowActionState {}

final class QadimShowActionSuccess extends QadimShowActionState {
  final QadimShowAuctionModel showActionModel;

  QadimShowActionSuccess(this.showActionModel);
}

final class QadimShowActionError extends QadimShowActionState {
  final String message;

  QadimShowActionError(this.message);
}
