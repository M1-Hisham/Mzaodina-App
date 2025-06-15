part of 'action_cubit.dart';

@immutable
abstract class ActionState {}

class ActionStateInitialStates extends ActionState {}

class ActionLoadingStates extends ActionState {}

class ActionSuccessStates extends ActionState {
  final MaxBid actionStatusModel;

  ActionSuccessStates({required this.actionStatusModel});
}

class ActionErrorStates extends ActionState {
  final String error;

  ActionErrorStates({required this.error});
}

class ActionEventLoadingStates extends ActionState {}

class ActionEventSuccessStates extends ActionState {
  // final AuctionModel actionStatusModel;

  // ActionEventSuccessStates({required this.actionStatusModel});
}

class ActionEventErrorStates extends ActionState {
  final String error;

  ActionEventErrorStates({required this.error});
}

class ActionChangeDateStates extends ActionState {}
