
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CustomNotItem extends StatelessWidget {
  const CustomNotItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(R.images.notItemImagePng, width: 175.w, height: 170.h),
        SizedBox(height: 20),
        Text('لايوجد مزادات', style: R.textStyles.font22blackW500Light),
      ],
    );
  }
}
