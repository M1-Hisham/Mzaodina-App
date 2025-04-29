import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 28, left: 28),
      width: 402.w,
      height: 160.h,
      decoration: BoxDecoration(
        color: R.colors.primaryColorLight,
        borderRadius:  BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            Text('أهلاً وسهلاً,', style: R.textStyles.font18GreyW500Light),
            SizedBox(height: 7.h),
            Row(
              children: [
                Text(
                  '👋 فهد القحطاني',
                  style: R.textStyles.font18WhiteW500Light,
                ),
                Spacer(),
                Stack(
                  children: [
                    SvgPicture.asset(R.images.iconNotiv),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: R.colors.redColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
