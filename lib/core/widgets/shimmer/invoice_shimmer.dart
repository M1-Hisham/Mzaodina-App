import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class InvoiceShimmer extends StatelessWidget {
  const InvoiceShimmer({super.key});

  Widget buildShimmer({
    required double width,
    required double height,
    BorderRadius? radius,
  }) {
    return Shimmer(
      color: Colors.grey.shade300, // ✅ اللون اللي طلبته
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: radius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildShimmer(width: 200.w, height: 20.h),
            SizedBox(height: 10.h),
            buildShimmer(width: 150.w, height: 20.h),
            SizedBox(height: 20.h),
            buildShimmer(
              width: 200.w,
              height: 185.h,
              radius: BorderRadius.circular(12),
            ),
            SizedBox(height: 22.h),
            buildShimmer(width: double.infinity, height: 60.h),
            SizedBox(height: 34.h),
            buildShimmer(width: double.infinity, height: 48.h),
            SizedBox(height: 18.h),
            Row(
              children: [
                buildShimmer(width: 160.w, height: 16.h),
                Spacer(),
                Row(
                  children: [
                    buildShimmer(width: 40.w, height: 16.h),
                    SizedBox(width: 8.w),
                    buildShimmer(width: 60.w, height: 20.h),
                  ],
                ),
              ],
            ),
            SizedBox(height: 90.h),
            buildShimmer(width: double.infinity, height: 40.h),
            SizedBox(height: 18.h),
            buildShimmer(width: double.infinity, height: 40.h),
            SizedBox(height: 22.h),
            Align(
              alignment: Alignment.bottomRight,
              child: buildShimmer(width: 136.w, height: 40.h),
            ),
            SizedBox(height: 27.h),
          ],
        ),
      ),
    );
  }
}
