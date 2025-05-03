import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            CustomAppBarAccount(title: 'الاعدادات'),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 14),
              decoration: BoxDecoration(color: R.colors.blackColor3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'تغير لغة التطبيق',
                    style: R.textStyles.font14Grey3W500Light,
                  ),

                  Text('English', style: R.textStyles.font14primaryW500Light),
                ],
              ),
            ),
            Divider(
              color: R.colors.colorUnSelected,
              height: 1,
              endIndent: 14,
              indent: 14,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 14),
              decoration: BoxDecoration(color: R.colors.blackColor3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('تغير الوضع', style: R.textStyles.font14Grey3W500Light),

                  Row(
                    children: [
                      Text('الفاتح', style: R.textStyles.font14Grey3W500Light),
                      SizedBox(width: 6),
                      Switch(
                        activeColor: R.colors.primaryColorLight,

                        value: false,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 14),
              decoration: BoxDecoration(color: R.colors.blackColor3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('الاشعارات', style: R.textStyles.font14Grey3W500Light),

                  Row(
                    children: [
                      Text('مفعل', style: R.textStyles.font14Grey3W500Light),
                      SizedBox(width: 6),
                      Switch(value: true, onChanged: (value) {}),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
