part of 'actions_count_cubit.dart';

sealed class ActionsCountState {}

final class ActionsCountInitial extends ActionsCountState {}

class ActionsCountLoading extends ActionsCountState {}

final class ActionsCountSuccess extends ActionsCountState {
  final ActionsCountModel response;

  ActionsCountSuccess(this.response);
}

final class ActionsCountFailure extends ActionsCountState {
  final String error;

  ActionsCountFailure(this.error);
}
