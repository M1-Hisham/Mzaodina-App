part of 'ongoing_cubit.dart';

sealed class OngoingState {}

final class OngoingInitial extends OngoingState {}

final class OngoingLoading extends OngoingState {}

final class OngoingSuccess extends OngoingState {
  final HomeDetailsModel data;

  OngoingSuccess(this.data);
}

final class OngoingError extends OngoingState {
  final String errorMessage;

  OngoingError(this.errorMessage);
}

class FilterState extends OngoingState {}
