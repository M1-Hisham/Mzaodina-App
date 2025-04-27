part of 'counter_cubit.dart';


sealed class CounterState {}

final class CounterInitial extends CounterState {}
class CountdownLoading extends CounterState {}

class CountdownLoaded extends CounterState {
  final int days;
  final int hours;
  final int minutes;
  final int seconds;

  CountdownLoaded({
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });
}

class CountdownError extends CounterState {
  final String message;

  CountdownError(this.message);
}