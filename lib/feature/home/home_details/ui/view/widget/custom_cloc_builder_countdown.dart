import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountdownUnitWidget(
                  value: state.days,
                  label: 'يوم',
                  maxValue: 365,
                  progressColor: progressColor,
                  backgroundColor: backgroundColor,
                ),
                SizedBox(width: 10.w),
                CountdownUnitWidget(
                  value: state.hours,
                  label: 'ساعة',
                  maxValue: 24,
                  progressColor: progressColor,
                  backgroundColor: backgroundColor,
                ),
                SizedBox(width: 10.w),
                CountdownUnitWidget(
                  value: state.minutes,
                  label: 'دقيقة',
                  maxValue: 60,
                  progressColor: progressColor,
                  backgroundColor: backgroundColor,
                ),
                SizedBox(width: 10.w),
                CountdownUnitWidget(
                  value: state.seconds,
                  label: 'ثانية',
                  maxValue: 60,
                  progressColor: progressColor,
                  backgroundColor: backgroundColor,
                ),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountdownUnitWidget(
                  value: 0,
                  label: 'يوم',
                  maxValue: 365,
                  progressColor: progressColor,
                  backgroundColor: backgroundColor,
                ),
                SizedBox(width: 8),
                CountdownUnitWidget(
                  value: 0,
                  label: 'ساعة',
                  maxValue: 24,
                  progressColor: progressColor,
                  backgroundColor: backgroundColor,
                ),
                SizedBox(width: 8),
                CountdownUnitWidget(
                  value: 0,
                  label: 'دقيقة',
                  maxValue: 60,
                  progressColor: progressColor,
                  backgroundColor: backgroundColor,
                ),
                SizedBox(width: 8),
                CountdownUnitWidget(
                  value: 0,
                  label: 'ثانية',
                  maxValue: 60,
                  progressColor: progressColor,
                  backgroundColor: backgroundColor,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
