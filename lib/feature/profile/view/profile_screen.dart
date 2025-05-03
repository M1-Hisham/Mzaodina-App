import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/app_button.dart';
import 'package:mzaodina_app/feature/profile/view/widget/customAccountListTile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),

                child: SafeArea(
                  child: CustomAppBarTitle(title: 'محمد القحطانى'),
                ),
              ),
              InkWell(
                onTap:
                    () => Navigator.pushNamed(
                      context,
                      AppRoutes.accountDetailsScreenRoute,
                    ),

                child: CustomAccountListTile(
                  title: 'معلومات الحساب',
                  leading: SvgPicture.asset(R.images.accountIcon),
                ),
              ),
              Divider(
                color: R.colors.colorUnSelected,
                height: 1.h,
                endIndent: 14.w,
                indent: 14.w,
              ),
              InkWell(
                onTap:
                    () => Navigator.pushNamed(
                      context,
                      AppRoutes.changePasswordScreenRoute,
                    ),
                child: CustomAccountListTile(
                  title: 'تغير كلمة المرور',
                  leading: SvgPicture.asset(R.images.passwordAccountIcon),
                ),
              ),
              Divider(
                color: R.colors.colorUnSelected,
                height: 1.h,
                endIndent: 14.w,
                indent: 14.w,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.settingScreennRoute);
                },

                child: CustomAccountListTile(
                  title: 'الاعدادات',
                  leading: SvgPicture.asset(R.images.settingIcon),
                ),
              ),
              SizedBox(height: 18.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.aboutUsScreenRoute);
                },

                child: CustomAccountListTile(title: 'من نحن'),
              ),
              Divider(
                color: R.colors.colorUnSelected,
                height: 1.h,
                endIndent: 14.w,
                indent: 14.w,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.termsAndConditionsScreenRoute,
                  );
                },

                child: CustomAccountListTile(title: 'الشروط والاحكام'),
              ),
              Divider(
                color: R.colors.colorUnSelected,
                height: 1.h,
                endIndent: 14.w,
                indent: 14.w,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.privacyPolicyScreenRoute,
                  );
                },

                child: CustomAccountListTile(title: 'سياسة الخصوصية'),
              ),
              Divider(
                color: R.colors.colorUnSelected,
                height: 1.h,
                endIndent: 14.w,
                indent: 14.w,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.shippingAndReturnPolicyScreenRoute,
                  );
                },

                child: CustomAccountListTile(title: 'سياسة الشحن والاسترجاع'),
              ),
              SizedBox(height: 18.h),

              CustomElevatedButton(
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 24.h,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 130.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: R.colors.greyColor3,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              'تسجيل الخروج',
                              style: R.textStyles.font14BlackW500Light.copyWith(
                                color: R.colors.redColor,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            CustomElevatedButton(
                              text: 'اغلاق',
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
              SizedBox(height: 24.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'التواصل الاجتماعى',
                    style: R.textStyles.font14Grey3W500Light,
                  ),

                  Row(
                    children: [
                      InkWell(
                        onTap: () => debugPrint('تواصل معنا على تويتر'),
                        child: SvgPicture.asset(R.images.xIcon),
                      ),
                      SizedBox(width: 18.h),
                      InkWell(
                        onTap: () => debugPrint('تواصل معنا على تويتر'),

                        child: SvgPicture.asset(R.images.tiktokIcon),
                      ),
                      SizedBox(width: 18.h),
                      InkWell(
                        onTap: () => debugPrint('تواصل معنا على تويتر'),

                        child: SvgPicture.asset(R.images.instaIcon),
                      ),
                      SizedBox(width: 18.h),
                      InkWell(
                        onTap: () => debugPrint('تواصل معنا على تويتر'),

                        child: SvgPicture.asset(R.images.snapIcon),
                      ),
                      Spacer(),

                      InkWell(
                        onTap: () => debugPrint('تواصل معنا على تويتر'),

                        child: Container(
                          width: 136.w,
                          decoration: BoxDecoration(
                            color: R.colors.greenColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 16.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'تواصل واتس أب',
                                style: R.textStyles.font12whiteW500Light,
                              ),
                              SvgPicture.asset(R.images.whatsIcon),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              Column(
                children: [
                  Text(
                    'الاصدار : 1.0.0',
                    style: R.textStyles.font12Grey3W500Light,
                  ),
                  Text(
                    'جميع الحقوق محفوظة لمنصة مزاود اين©2024',
                    style: R.textStyles.font12Grey3W500Light,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBarTitle extends StatelessWidget {
  final String title;
  const CustomAppBarTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'اهلا”',
          style: R.textStyles.font18GreyW500Light.copyWith(
            color: R.colors.greyColor3,
          ),
        ),
        Text(title, style: R.textStyles.font18primaryW500Light),
      ],
    );
  }
}

class CustomBottonNotLogin extends StatelessWidget {
  const CustomBottonNotLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: R.colors.blackColor3,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(14),

      child: Column(
        children: [
          Text(
            'انت غير مسجل في مزاودين',
            style: R.textStyles.font14Grey3W500Light,
          ),
          SizedBox(height: 17.h),
          CustomElevatedButton(text: 'تسجيل الدخول', onPressed: () {}),
        ],
      ),
    );
  }
}
