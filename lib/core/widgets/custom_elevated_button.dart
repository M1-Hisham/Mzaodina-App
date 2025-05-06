import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

/// Generic button widget
class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? heigth;
  final double? width;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? overlayColor;
  final TextStyle? textStyle;
  final Widget? icon;
  final TextDirection? textDirection;
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.heigth,
    this.backgroundColor,
    this.borderRadius,
    this.textStyle,
    this.icon,
    this.borderColor,
    this.overlayColor,
    this.textDirection,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection ?? TextDirection.ltr,
      child: SizedBox(
        width: width ?? double.infinity,
        height: heigth ?? 50.h,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: icon,
          iconAlignment: IconAlignment.start,
          style: OutlinedButton.styleFrom(
            shadowColor: Colors.transparent,
            overlayColor: overlayColor ?? R.colors.primaryColorLight,
            side: BorderSide(color: borderColor ?? Colors.transparent),
            backgroundColor: backgroundColor ?? R.colors.primaryColorLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
            ),
          ),
          label: FittedBox(
            child: Text(
              text,
              style: textStyle ?? R.textStyles.font14whiteW500Light,
            ),
          ),
        ),
      ),
    );
  }
}
