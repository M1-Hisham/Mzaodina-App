import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CountdownUnitWidget extends StatelessWidget {
  final int value;
  final String label;
  final int maxValue;
  final Color progressColor;
  final Color backgroundColor;
  final double sizeFactor;
  const CountdownUnitWidget({
    super.key,
    required this.value,
    required this.label,
    required this.maxValue,
    this.progressColor = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.sizeFactor = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    double progress = 1 -(value /maxValue); //ده علشا ن المؤشر يبدأ مليان وينتهي فاضي لو عاوز العكس استخدم اما لو عاوز العكس استخدم value / maxValue ع طول

    progress = progress.clamp(0.0, 1.0);

    return LayoutBuilder(
      builder: (context, constraints) {
        // استخدام أصغر بعد (عرض أو ارتفاع) لضمان التناسب
        final minDimension =
            constraints.maxWidth > constraints.maxHeight
                ? constraints.maxHeight
                : constraints.maxWidth;

        // حساب القطر بناء على المساحة المتاحة
        final diameter = minDimension * sizeFactor;

        // سماكة المؤشر
        final strokeWidth = diameter * 0.1;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              // width: diameter.w,
              // height: diameter.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: diameter,
                    height: diameter,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: strokeWidth,
                      color: progressColor,
                      backgroundColor: backgroundColor,
                    ),
                  ),

                  Center(
                    child: Text(
                      value.toString().padLeft(2, '0'),
                      style: R.textStyles.font16BlackW400Light.copyWith(
                        color: progressColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              label,
              style: R.textStyles.font12primaryW600Light.copyWith(
                color: R.colors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}
