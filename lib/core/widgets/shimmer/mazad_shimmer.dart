import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class MazadShimmer extends StatelessWidget {
  const MazadShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: R.colors.whiteLight,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: R.colors.whiteColor2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer(
                      duration: const Duration(seconds: 2),
                      interval: const Duration(seconds: 2),
                      child: Container(
                        width: 120.w,
                        height: 158.h,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer(
                            child: Container(
                              height: 20.h,
                              width: double.infinity,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Shimmer(
                            child: Container(
                              height: 16.h,
                              width: double.infinity,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Shimmer(
                            child: Container(
                              height: 14.h,
                              width: double.infinity,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Shimmer(
                            child: Container(
                              height: 14.h,
                              width: double.infinity,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Shimmer(
                            child: Container(
                              height: 18.h,
                              width: 100.w,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Shimmer(
                        child: Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 11.w),
                    Expanded(
                      child: Shimmer(
                        child: Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: R.colors.whiteLight,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: R.colors.whiteColor2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer(
                      duration: const Duration(seconds: 2),
                      interval: const Duration(seconds: 2),
                      child: Container(
                        width: 120.w,
                        height: 158.h,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer(
                            child: Container(
                              height: 20.h,
                              width: double.infinity,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Shimmer(
                            child: Container(
                              height: 16.h,
                              width: double.infinity,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Shimmer(
                            child: Container(
                              height: 14.h,
                              width: double.infinity,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Shimmer(
                            child: Container(
                              height: 14.h,
                              width: double.infinity,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Shimmer(
                            child: Container(
                              height: 18.h,
                              width: 100.w,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Shimmer(
                        child: Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 11.w),
                    Expanded(
                      child: Shimmer(
                        child: Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
