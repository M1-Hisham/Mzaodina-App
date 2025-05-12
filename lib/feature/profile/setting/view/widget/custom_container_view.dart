import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

Widget customContainerView() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14),
    decoration: BoxDecoration(
      color: R.colors.blackColor3,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      spacing: 18,
      children: [
        // SizedBox(height: 18),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       'تغير لغة التطبيق',
        //       style: R.textStyles.font14Grey3W500Light,
        //     ),
        //     Text('English', style: R.textStyles.font14primaryW500Light),
        //   ],
        // ),
        // Divider(
        //   color: R.colors.colorUnSelected,
        //   height: 1,
        //   endIndent: 14,
        //   indent: 14,
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text('تغير الوضع', style: R.textStyles.font14Grey3W500Light),
        //     Row(
        //       children: [
        //         Text('الفاتح', style: R.textStyles.font14Grey3W500Light),
        //         SizedBox(width: 6),
        //         Switch(
        //           activeColor: R.colors.primaryColorLight,
        //           value: false,
        //           onChanged: (value) {},
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('الاشعارات', style: R.textStyles.font14Grey3W500Light),

            Row(
              children: [
                Text('مفعل', style: R.textStyles.font14Grey3W500Light),
                SizedBox(width: 6),
                Switch(
                  value: true,
                  onChanged: (value) {},
                  activeTrackColor: R.colors.primaryColorLight,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
