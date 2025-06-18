// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mzaodina_app/feature/home/ui/view/widget/custom_countdown_unit.dart';
// import 'package:mzaodina_app/feature/home/ui/view_model/counter_cubit/counter_cubit.dart';

// class OngoingCountdown extends StatelessWidget {
//   final DateTime eventTime;
//   final DateTime Function() getNow;
//   final Color progressColor;
//   final Color backgroundColor;
//   const OngoingCountdown({
//     super.key,
//     required this.eventTime,
//     required this.getNow,
//     required this.progressColor,
//     required this.backgroundColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => CounterCubit(eventTime: eventTime, getNow: getNow),
//       child: BlocBuilder<CounterCubit, CounterState>(
//         builder: (context, state) {
//           int s = 0, m = 0, h = 0, d = 0;
//           if (state is CountdownRunning) {
//             d = state.days;
//             h = state.hours;
//             m = state.minutes;
//             s = state.seconds;
//           }

//           return Row(
//             children: [
//               Expanded(
//                 child: CountdownUnitWidget(
//                   value: s,
//                   label: 'ثانية',
//                   maxValue: 60,
//                   progressColor: progressColor,
//                   backgroundColor: backgroundColor,
//                 ),
//               ),
//               Expanded(
//                 child: CountdownUnitWidget(
//                   value: m,
//                   label: 'دقيقة',
//                   maxValue: 60,
//                   progressColor: progressColor,
//                   backgroundColor: backgroundColor,
//                 ),
//               ),
//               Expanded(
//                 child: CountdownUnitWidget(
//                   value: h,
//                   maxValue: 24,
//                   backgroundColor: backgroundColor,
//                   label: 'ساعة',
//                   progressColor: progressColor,
//                 ),
//               ),
//               Expanded(
//                 child: CountdownUnitWidget(
//                   value: d,
//                   label: 'يوم',
//                   maxValue: 365,
//                   progressColor: progressColor,
//                   backgroundColor: backgroundColor,
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_countdown_unit.dart';
import 'package:mzaodina_app/feature/home/ui/view_model/counter_cubit/counter_cubit.dart';

class OngoingCountdown extends StatefulWidget {
  final DateTime eventTime;
  final DateTime Function() getNow;
  final Color progressColor;
  final Color backgroundColor;

  const OngoingCountdown({
    super.key,
    required this.eventTime,
    required this.getNow,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  State<OngoingCountdown> createState() =>
      _OngoingCountdownState();
}

class _OngoingCountdownState
    extends State<OngoingCountdown> {
  late CounterCubit _counterCubit;

  @override
  void initState() {
    super.initState();
    _counterCubit = CounterCubit(
      eventTime: widget.eventTime,
      getNow: widget.getNow,
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _counterCubit,
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          int s = 0, m = 0, h = 0, d = 0;
          if (state is CountdownRunning) {
            d = state.days;
            h = state.hours;
            m = state.minutes;
            s = state.seconds;
          }

          return Row(
            children: [
              Expanded(
                child: CountdownUnitWidget(
                  value: s,
                  label: 'ثانية',
                  maxValue: 60,
                  progressColor: widget.progressColor,
                  backgroundColor: widget.backgroundColor,
                ),
              ),
              Expanded(
                child: CountdownUnitWidget(
                  value: m,
                  label: 'دقيقة',
                  maxValue: 60,
                  progressColor: widget.progressColor,
                  backgroundColor: widget.backgroundColor,
                ),
              ),
              Expanded(
                child: CountdownUnitWidget(
                  value: h,
                  maxValue: 24,
                  backgroundColor: widget.backgroundColor,
                  label: 'ساعة',
                  progressColor: widget.progressColor,
                ),
              ),
              Expanded(
                child: CountdownUnitWidget(
                  value: d,
                  label: 'يوم',
                  maxValue: 365,
                  progressColor: widget.progressColor,
                  backgroundColor: widget.backgroundColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
