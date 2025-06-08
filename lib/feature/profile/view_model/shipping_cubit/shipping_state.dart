part of 'shipping_cubit.dart';

sealed class ShippingState {}

final class ShippingInitial extends ShippingState {}

final class ShippingLoading extends ShippingState {}

final class ShippingSuccess extends ShippingState {
  final InfoResponse data;

  ShippingSuccess(this.data);
}

final class ShippingError extends ShippingState {
  final String message;

  ShippingError(this.message);
}
