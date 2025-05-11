import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_account_list_tile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

              //check if user is logged in or not
              // user == null ?
              CustomBottonNotLogin(),
              // :
              //C1

              // Container(
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: R.colors.blackColor3,
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(color: R.colors.blackColor3),
              //   ),
              //   child: Column(
              //     children: [
              //       InkWell(
              //         onTap:
              //             () => Navigator.pushNamed(
              //               context,
              //               AppRoutes.accountDetailsScreenRoute,
              //             ),
              //         child: CustomAccountListTile(
              //           title: 'معلومات الحساب',
              //           leading: SvgPicture.asset(
              //             R.images.accountIcon,
              //             width: 17.5.w,
              //             height: 17.5.w,
              //           ),
              //         ),
              //       ),
              //       Divider(
              //         color: R.colors.colorUnSelected,
              //         height: 1.h,
              //         endIndent: 14.w,
              //         indent: 14.w,
              //       ),
              //       InkWell(
              //         onTap:
              //             () => Navigator.pushNamed(
              //               context,
              //               AppRoutes.changePasswordScreenRoute,
              //             ),
              //         child: CustomAccountListTile(
              //           title: 'تغير كلمة المرور',
              //           leading: SvgPicture.asset(
              //             R.images.passwordAccountIcon,
              //             width: 17.5.w,
              //             height: 17.5.w,
              //           ),
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () {
              //           Navigator.pushNamed(
              //             context,
              //             AppRoutes.settingScreenRoute,
              //           );
              //         },
              //         child: CustomAccountListTile(
              //           title: 'الاعدادات',
              //           leading: SvgPicture.asset(
              //             R.images.settingIcon,
              //             width: 17.5.w,
              //             height: 17.5.w,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 30.h),
              //C2
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: R.colors.blackColor3,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: R.colors.blackColor3),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.aboutUsScreenRoute,
                        );
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

                      child: CustomAccountListTile(
                        title: 'سياسة الشحن والاسترجاع',
                      ),
                    ),
                  ],
                ),
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
                                borderRadius: BorderRadius.circular(100.r),
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
                        onTap: () async {
                          if (await canLaunchUrl(
                            Uri.parse('https://x.com/Mzaodin'),
                          )) {
                            // Check if the URL can be launched
                            await launchUrl(
                              Uri.parse('https://x.com/Mzaodin'),
                              mode: LaunchMode.externalApplication,
                            ); // Launch the URL
                          } else {
                            // Handle the error if the URL cannot be launched
                            debugPrint('Could not launch URL');
                            SnackBar(content: Text('Could not launch URL'));
                            // throw 'Could not launch'; // throw could be used to handle erroneous situations
                          }
                        },
                        child: SvgPicture.asset(
                          R.images.xIcon,
                          width: 25.w,
                          height: 25.h,
                        ),
                      ),
                      SizedBox(width: 18.h),
                      InkWell(
                        onTap: () async {
                          if (await canLaunchUrl(
                            Uri.parse('https://www.tiktok.com/@mzaodin'),
                          )) {
                            // Check if the URL can be launched
                            await launchUrl(
                              Uri.parse('https://www.tiktok.com/@mzaodin'),
                              mode: LaunchMode.externalApplication,
                            ); // Launch the URL
                          } else {
                            // Handle the error if the URL cannot be launched
                            debugPrint('Could not launch URL');
                            SnackBar(content: Text('Could not launch URL'));
                            // throw 'Could not launch'; // throw could be used to handle erroneous situations
                          }
                        },
                        child: SvgPicture.asset(
                          R.images.tiktokIcon,
                          width: 25.w,
                          height: 25.h,
                        ),
                      ),
                      SizedBox(width: 18.h),
                      InkWell(
                        onTap: () async {
                          if (await canLaunchUrl(
                            Uri.parse(
                              'https://www.instagram.com/mzaodin/?hl=ar',
                            ),
                          )) {
                            // Check if the URL can be launched
                            await launchUrl(
                              Uri.parse(
                                'https://www.instagram.com/mzaodin/?hl=ar',
                              ),
                              mode: LaunchMode.externalApplication,
                            ); // Launch the URL
                          } else {
                            // Handle the error if the URL cannot be launched
                            debugPrint('Could not launch URL');
                            SnackBar(content: Text('Could not launch URL'));
                            // throw 'Could not launch'; // throw could be used to handle erroneous situations
                          }
                        },
                        child: SvgPicture.asset(
                          R.images.instaIcon,
                          width: 25.w,
                          height: 25.h,
                        ),
                      ),

                      SizedBox(width: 18.h),
                      InkWell(
                        onTap: () async {
                          if (await canLaunchUrl(
                            Uri.parse('https://www.snapchat.com/add/mzaodin'),
                          )) {
                            // Check if the URL can be launched
                            await launchUrl(
                              Uri.parse('https://www.snapchat.com/add/mzaodin'),
                              mode: LaunchMode.externalApplication,
                            ); // Launch the URL
                          } else {
                            // Handle the error if the URL cannot be launched
                            debugPrint('Could not launch URL');
                            SnackBar(content: Text('Could not launch URL'));
                            // throw 'Could not launch'; // throw could be used to handle erroneous situations
                          }
                        },
                        child: SvgPicture.asset(
                          R.images.snapIcon,
                          width: 25.w,
                          height: 25.h,
                        ),
                      ),
                      Spacer(),

                      InkWell(
                        onTap: () async {
                          await launchUrlString(
                            'https://wa.me/+966533576110?text=Hello,\ni\'m coming from App Mzaodina',
                            mode: LaunchMode.externalApplication,
                          );
                        },
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
                                style: R.textStyles.font10whiteW500Light,
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
              SizedBox(height: 24.h),
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
      padding: EdgeInsets.all(14.r),

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
