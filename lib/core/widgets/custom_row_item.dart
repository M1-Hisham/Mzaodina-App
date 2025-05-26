import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CoustomRowItem extends StatelessWidget {
  final String title, price;
  final TextStyle? style;
  final TextStyle? priceStyle;
  final Color? containerColor;
  final Color? textColor;
  final Color? priceColor;
  const CoustomRowItem({
    super.key,
    required this.title,
    required this.price,
    this.style,
    this.priceStyle,
    this.containerColor,
    this.textColor,
    this.priceColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      color: containerColor ?? R.colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                style ??
                R.textStyles.font12Grey3W500Light.copyWith(
                  color: textColor ?? R.colors.greyColor3,
                ),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                price,
                style:
                    priceStyle ??
                    R.textStyles.font14BlackW500Light.copyWith(
                      color: priceColor ?? R.colors.primaryColorLight,
                    ),
              ),
              SizedBox(width: 4.w),
              SvgPicture.asset(R.images.riyalImage),
            ],
          ),
        ],
      ),
    );
  }
}
