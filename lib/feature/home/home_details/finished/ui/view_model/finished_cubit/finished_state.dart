part of 'finished_cubit.dart';

sealed class FinishedState {}

final class FinishedInitial extends FinishedState {}

final class FinishedLoading extends FinishedState {}

final class FinishedSuccess extends FinishedState {
  final HomeDetailsModel data;

  FinishedSuccess(this.data);
}

final class FinishedError extends FinishedState {
  final String errorMessage;

  FinishedError(this.errorMessage);
}
