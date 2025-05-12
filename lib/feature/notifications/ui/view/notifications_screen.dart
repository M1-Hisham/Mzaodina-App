import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            _customAppBar(title: 'الإشعارات', context: context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: R.colors.blackColor3,

                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'تم اختيارك للفوز – أكمل الآن واحتفل بجائزتك!',
                            style: R.textStyles.font14BlackW500Light,
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.invoiceDetailsScreenRoute,
                              );
                            },
                            child: Text(
                              'اضغط',
                              style: R.textStyles.font14primaryW500Light,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: R.colors.blackColor3,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'تم اختيارك للفوز – أكمل الآن واحتفل بجائزتك!',
                              style: R.textStyles.font14BlackW500Light,
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'اضغط',
                                style: R.textStyles.font14primaryW500Light,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customAppBar({required String title, context}) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(title, style: R.textStyles.font18blackW500Light),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(R.images.backIcon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
