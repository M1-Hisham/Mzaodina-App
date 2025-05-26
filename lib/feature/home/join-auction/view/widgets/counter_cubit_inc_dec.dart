import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitIncDec extends Cubit<int> {
  static const int minValue = 1;
  final int maxValue;
  final int price;
  CounterCubitIncDec({required this.maxValue, required this.price})
    : super(minValue);

  int get totalAmount => state * price;

  void increment() {
    if (state < maxValue - minValue) emit(state + 1);
  }

  void decrement() {
    if (state != minValue) emit(state - 1);
  }
}
