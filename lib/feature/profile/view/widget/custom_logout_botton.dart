import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/helper/user_session.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';

class CustomLogoutBotton extends StatelessWidget {
  const CustomLogoutBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: CustomElevatedButton(
        textStyle: R.textStyles.font14Grey3W500Light.copyWith(
          color: R.colors.redColor2,
        ),
        textDirection: TextDirection.rtl,
        backgroundColor: R.colors.redColor3,
        text: 'تسجيل الخروج',

        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 130.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: R.colors.greyColor3,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    GestureDetector(
                      onTap: () async {
                        await UserSession.logout();
                        Navigator.pushNamedAndRemoveUntil(
                          // ignore: use_build_context_synchronously
                          context,
                          AppRoutes.authRouter,
                          (route) => false,
                        );
                      },
                      child: Text(
                        'تسجيل الخروج',
                        style: R.textStyles.font14BlackW500Light.copyWith(
                          color: R.colors.redColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    CustomElevatedButton(
                      text: 'الغاء',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              );
            },
          );
        },
        icon: SvgPicture.asset(R.images.logoutImage),
      ),
    );
  }
}
