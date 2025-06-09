part of 'about_us_cubit.dart';

sealed class AboutUsState {}

final class AboutUsInitial extends AboutUsState {}

final class AboutUsLoading extends AboutUsState {}

final class AboutUsSuccess extends AboutUsState {
  final InfoResponse data;

  AboutUsSuccess(this.data);
}

final class AboutUsError extends AboutUsState {
  final String message;

  AboutUsError(this.message);
}
