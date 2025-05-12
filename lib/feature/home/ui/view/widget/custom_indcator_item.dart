import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CustomIndcatorItem extends StatelessWidget {
  final String title;
  final bool showIndicator;
  final TextStyle? style;
  const CustomIndcatorItem({
    super.key,
    required this.title,
    required this.showIndicator,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Text(
            title,
            style:
                style ??
                R.textStyles.font12primaryW600Light.copyWith(
                  color: R.colors.greyColor3,
                ),
          ),
          if (showIndicator)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),

                  child: LinearProgressIndicator(
                    minHeight: 8.h,
                    borderRadius: BorderRadius.circular(99),
                    value: 0.5,
                    backgroundColor: R.colors.colorUnSelected,
                    color: R.colors.primaryColorLight,
                  ),
                ),
              ),
            ),
          if (!showIndicator) Spacer(),
          Text(
            '${(0.5 * 100).toStringAsFixed(0)} %',
            style: R.textStyles.font12primaryW600Light.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
