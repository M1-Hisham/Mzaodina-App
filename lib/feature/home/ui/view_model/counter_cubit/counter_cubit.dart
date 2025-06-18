import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final DateTime durationTime;
  final DateTime Function() getNow; // ⬅️ دالة ترجع الوقت الحالي من WebSocket
  Timer? _timer;

  CounterCubit({required this.durationTime, required this.getNow})
    : super(CounterInitial()) {
    _start();
  }

  void _start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final now = getNow();
      final diff = durationTime.difference(now);

      if (diff.isNegative || diff == Duration.zero) {
        emit(CountdownFinished());
        _timer?.cancel();
      } else {
        emit(
          CountdownRunning(
            days: diff.inDays,
            hours: diff.inHours % 24,
            minutes: diff.inMinutes % 60,
            seconds: diff.inSeconds % 60,
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
