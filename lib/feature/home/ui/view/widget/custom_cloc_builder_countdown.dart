
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_countdown_unit.dart';
import 'package:mzaodina_app/feature/home/ui/view_model/counter_cubit/counter_cubit.dart';

class CustomBlocBuilderCountdown extends StatelessWidget {
  final DateTime eventTime;

  const CustomBlocBuilderCountdown({super.key, required this.eventTime});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(eventTime),
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          if (state is CountdownLoading) {
            return const CircularProgressIndicator();
          } else if (state is CountdownFinished) {
            return const Text('انتهى الوقت!', style: TextStyle(fontSize: 24));
          } else if (state is CountdownRunning) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountdownUnitWidget(
                  value: state.days,
                  label: 'يوم',
                  maxValue: 365, 
                ),
                const SizedBox(width: 8),
                CountdownUnitWidget(
                  value: state.hours,
                  label: 'ساعة',
                  maxValue: 24,
                ),
                const SizedBox(width: 8),
                CountdownUnitWidget(
                  value: state.minutes,
                  label: 'دقيقة',
                  maxValue: 60,
                ),
                const SizedBox(width: 8),
                CountdownUnitWidget(
                  value: state.seconds,
                  label: 'ثانية',
                  maxValue: 60,
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
