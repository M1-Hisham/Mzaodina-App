import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CustomCardImageDetails extends StatelessWidget {
  const CustomCardImageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 18),
            child: Image.asset(
              R.images.phoneImagePng,
              width: double.infinity,
              height: 158.h,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 9.w),
                height: 62.h,
                width: 80.w,
                decoration: BoxDecoration(
                  border: Border.all(color: R.colors.whiteColor2, width: 1),
                  color: R.colors.blackColor2,

                  borderRadius: BorderRadius.circular(11.r),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    R.images.phoneImagePng,
                    width: 43,
                    height: 39,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 9.w),
                height: 62.h,
                width: 80.w,
                decoration: BoxDecoration(
                  border: Border.all(color: R.colors.whiteColor2, width: 1),
                  color: R.colors.blackColor2,
                  borderRadius: BorderRadius.circular(11.r),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    R.images.phoneImagePng,
                    width: 43,
                    height: 39,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 9.w),
                height: 62.h,
                width: 80.w,
                decoration: BoxDecoration(
                  border: Border.all(color: R.colors.whiteColor2, width: 1),
                  color: R.colors.blackColor2,

                  borderRadius: BorderRadius.circular(11.r),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    R.images.phoneImagePng,
                    width: 43,
                    height: 39,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 9.w),
                height: 62.h,
                width: 80.w,
                decoration: BoxDecoration(
                  border: Border.all(color: R.colors.whiteColor2, width: 1),
                  color: R.colors.blackColor2,

                  borderRadius: BorderRadius.circular(11.r),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    R.images.phoneImagePng,
                    width: 43,
                    height: 39,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
