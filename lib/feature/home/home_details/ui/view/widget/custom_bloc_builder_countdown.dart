import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_countdown_unit.dart';
import 'package:mzaodina_app/feature/home/ui/view_model/counter_cubit/counter_cubit.dart';

class CustomBlocBuilderCountdown extends StatelessWidget {
  final DateTime eventTime;
  final Color progressColor;
  final Color backgroundColor;
  const CustomBlocBuilderCountdown({
    super.key,
    required this.eventTime,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(eventTime),
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          if (state is CountdownRunning) {
            return Row(
              children: [
                Expanded(
                  child: CountdownUnitWidget(
                    value: state.seconds,
                    label: 'ثانية',
                    maxValue: 60,
                    progressColor: progressColor,
                    backgroundColor: backgroundColor,
                  ),
                ),
                Expanded(
                  child: CountdownUnitWidget(
                    value: state.minutes,
                    label: 'دقيقة',
                    maxValue: 60,
                    progressColor: progressColor,
                    backgroundColor: backgroundColor,
                  ),
                ),
                Expanded(
                  child: CountdownUnitWidget(
                    value: state.hours,
                    maxValue: 24,
                    backgroundColor: backgroundColor,
                    label: 'ساعة',
                    progressColor: progressColor,
                  ),
                ),
                Expanded(
                  child: CountdownUnitWidget(
                    value: state.days,
                    label: 'يوم',
                    maxValue: 365,
                    progressColor: progressColor,
                    backgroundColor: backgroundColor,
                  ),
                ),
              ],
            );
          } else {
            return Row(
              children: [
                Expanded(
                  child: CountdownUnitWidget(
                    value: 0,
                    label: 'ثانية',
                    maxValue: 60,
                    progressColor: progressColor,
                    backgroundColor: backgroundColor,
                  ),
                ),
                Expanded(
                  child: CountdownUnitWidget(
                    value: 0,
                    label: 'دقيقة',
                    maxValue: 60,
                    progressColor: progressColor,
                    backgroundColor: backgroundColor,
                  ),
                ),
                Expanded(
                  child: CountdownUnitWidget(
                    value: 0,
                    label: 'ساعة',
                    maxValue: 24,
                    progressColor: progressColor,
                    backgroundColor: backgroundColor,
                  ),
                ),
                Expanded(
                  child: CountdownUnitWidget(
                    value: 0,
                    label: 'يوم',
                    maxValue: 365,
                    progressColor: progressColor,
                    backgroundColor: backgroundColor,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
