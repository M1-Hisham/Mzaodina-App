part of 'jaraa_cubit.dart';

sealed class JaraaState {}

final class JaraaInitial extends JaraaState {}

final class JaraaLoading extends JaraaState {}

final class JaraaSuccess extends JaraaState {
  final JaraaAuctionResponse data;

  JaraaSuccess(this.data);
}

final class JaraaError extends JaraaState {
  final String errorMessage;

  JaraaError(this.errorMessage);
}