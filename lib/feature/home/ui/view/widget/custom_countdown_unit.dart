import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CountdownUnitWidget extends StatelessWidget {
  final int value;
  final String label;
  final int maxValue;
  final Color progressColor;
  final Color backgroundColor;

  const CountdownUnitWidget({
    super.key,
    required this.value,
    required this.label,
    required this.maxValue, required this.progressColor, required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    double progress = 1 - (value / maxValue);
    progress = progress.clamp(0.0, 1.0);

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircularPercentIndicator(
              radius: 20.r,
              lineWidth: 5,
              percent: progress,
              progressColor: progressColor,
              backgroundColor: backgroundColor,
              circularStrokeCap: CircularStrokeCap.round,
              center: Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: R.colors.whiteLight,
                ),
                child: Center(
                  child: Text(
                    value.toString().padLeft(2, '0'),
                    style: R.textStyles.font14whiteW500Light.copyWith(
                      color: R.colors.primaryColorLight,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: R.textStyles.font12primaryW600Light.copyWith(
            color: R.colors.black,
          ),
        ),
      ],
    );
  }
}
