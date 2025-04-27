import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void startCountdown(int totalMinutes) {
    try {
      final totalSeconds = totalMinutes * 60;

      final days = totalSeconds ~/ (24 * 3600);
      final hours = (totalSeconds % (24 * 3600)) ~/ 3600;
      final minutes = (totalSeconds % 3600) ~/ 60;
      final seconds = totalSeconds % 60;

      emit(
        CountdownLoaded(
          days: days,
          hours: hours,
          minutes: minutes,
          seconds: seconds,
        ),
      );
    } catch (e) {
      emit(CountdownError(e.toString()));
    }
  }
}
