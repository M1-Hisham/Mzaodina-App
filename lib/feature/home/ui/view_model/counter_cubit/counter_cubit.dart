import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/helper/countdown_helper.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final DateTime eventTime;
  Timer? _timer;
  CounterCubit(this.eventTime) : super(CounterInitial()) {
    _start();
  }

  void _start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final diff = CountdownHelper.calculateDifference(eventTime);

      if (diff == Duration.zero) {
        emit(CountdownFinished());
        _timer?.cancel();
      } else {
        final breakdown = CountdownHelper.breakdown(diff);
        emit(
          CountdownRunning(
            days: breakdown['days']!,
            hours: breakdown['hours']!,
            minutes: breakdown['minutes']!,
            seconds: breakdown['seconds']!,
          ),
        );
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
