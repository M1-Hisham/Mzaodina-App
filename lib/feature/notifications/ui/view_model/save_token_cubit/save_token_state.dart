part of 'save_token_cubit.dart';

sealed class SaveTokenState {}

final class SaveTokenInitial extends SaveTokenState {}

final class SaveTokenLoading extends SaveTokenState {}

final class SaveTokenSuccess extends SaveTokenState {
  final SaveTokenResponceModel saveTokenResponceModel;

  SaveTokenSuccess(this.saveTokenResponceModel);
}

final class SaveTokenFailure extends SaveTokenState {
  final String error;

  SaveTokenFailure(this.error);
}
