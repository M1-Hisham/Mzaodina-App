import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

/// Generic button widget
class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? heigth;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? overlayColor;
  final TextStyle? textStyle;
  final Widget? icon;
  const AppButton({
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
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: heigth ?? 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        iconAlignment: IconAlignment.start,
        style: OutlinedButton.styleFrom(
          overlayColor: overlayColor ?? R.colors.primaryColorLight,
          side: BorderSide(color: borderColor ?? Colors.transparent),
          backgroundColor: backgroundColor ?? R.colors.primaryColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
        ),
        label: FittedBox(
          child: Text(
            text,
            style:
                textStyle ??
                TextStyle(
                  fontSize: 16,
                  color: R.colors.whiteLight,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
