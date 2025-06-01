import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/data/model/tap_view_model.dart';

class CustomTapItem extends StatelessWidget {
  final TapViewModel item;
  final bool isSelected;
  final Color selectedColor;
  final String counter;
  const CustomTapItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.selectedColor,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: isSelected ? selectedColor : R.colors.colorUnSelected,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            textAlign: TextAlign.center,
            item.title,
            style:
                isSelected
                    ? R.textStyles.font14whiteW500Light
                    : R.textStyles.font14BlackW500Light,
          ),
        ),
        Positioned(
          bottom: 9.h,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.h),
              decoration: BoxDecoration(
                color: R.colors.greyColor2,
                borderRadius: BorderRadius.circular(99.r),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  counter,
                  style: R.textStyles.font10whiteW500Light,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
