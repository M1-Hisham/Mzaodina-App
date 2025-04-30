import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CoustomRowItem extends StatelessWidget {
  final String title, price;
  final TextStyle? style;
  final TextStyle? priceStyle;
  final Color? containerColor;
  const CoustomRowItem({
    super.key,
    required this.title,
    required this.price,
    this.style,
    this.priceStyle,
    this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      color: containerColor ?? R.colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: style ?? R.textStyles.font12Grey3W500Light),
          Spacer(),
          Row(
            children: [
              Text(
                price,
                style: priceStyle ?? R.textStyles.font12primaryW600Light,
              ),
              SvgPicture.asset(R.images.riyalImage),
            ],
          ),
        ],
      ),
    );
  }
}
