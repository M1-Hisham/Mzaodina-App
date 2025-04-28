part of 'counter_cubit.dart';


sealed class CounterState {
  const CounterState();
}

final class CounterInitial extends CounterState {}
class CountdownLoading extends CounterState {}


class CountdownRunning extends CounterState {
  final int days;
  final int hours;
  final int minutes;
  final int seconds;

  const CountdownRunning({
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });


}

class CountdownFinished extends CounterState {
}