import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/data/model/tap_view_model.dart';

class CustomTapItem extends StatelessWidget {
  final TapViewModel item;
  final bool isSelected;
  const CustomTapItem({
    super.key,
    required this.item,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? R.colors.primaryColorLight
                    : R.colors.colorUnSelected,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            item.title,
            style:
                isSelected
                    ? R.textStyles.font14whiteW500Light
                    : R.textStyles.font14BlackW500Light,
          ),
        ),
        Positioned(
          bottom: -5,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: R.colors.greyColor2,
                borderRadius: BorderRadius.circular(99.r),
              ),
              child: Text(
                item.counter,
                style: R.textStyles.font12whiteW500Light,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
