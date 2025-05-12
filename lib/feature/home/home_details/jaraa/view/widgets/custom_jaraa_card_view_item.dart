import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_bloc_builder_countdown.dart';
import 'package:share_plus/share_plus.dart';

class CustomJaraaCardViewItem extends StatefulWidget {
  const CustomJaraaCardViewItem({super.key});

  @override
  State<CustomJaraaCardViewItem> createState() =>
      _CustomQadimCardViewItemState();
}

class _CustomQadimCardViewItemState extends State<CustomJaraaCardViewItem> {
  DateTime eventTimeFromApi = DateTime.parse('2025-05-04 18:00:00');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
              mainAxisSize: MainAxisSize.min,

              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      R.images.phoneImagePng,
                      width: 120.w,
                      height: 158.h,
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Text(
                              'مزاد على ايفون 16 برو من ابل',
                              style: R.textStyles.font16BlackW500Light,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          CustomBlocBuilderCountdown(
                            eventTime: eventTimeFromApi,
                            progressColor: R.colors.greenColor,
                            backgroundColor: R.colors.greenColor2,
                          ),
                          SizedBox(height: 12.h),
                          CoustomRowItem(
                            title: 'السعر بالأسواق',
                            price: '1,000.00  ',
                          ),
                          CoustomRowItem(title: 'اعلى مزاد', price: '600.00  '),

                          Container(
                            padding: EdgeInsets.symmetric(vertical: 6.h),
                            color: R.colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'المزاود',
                                  style: R.textStyles.font12Grey3W500Light,
                                ),
                                Spacer(),
                                Text(
                                  'لايوجد',
                                  style: R.textStyles.font16primaryW600Light,
                                ),
                              ],
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
                      child: CustomElevatedButton(
                        text: 'عرض التفاصيل',
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.homeDetailsJaraaScreenRoute,
                            arguments: {'eventTime': eventTimeFromApi},
                          );
                        },
                        backgroundColor: R.colors.primaryColorLight,
                        borderRadius: 8.r,
                        heigth: 40.h,
                        textStyle: R.textStyles.font12GreyW500Light.copyWith(
                          color: R.colors.whiteLight,
                        ),
                      ),
                    ),
                    SizedBox(width: 11.w),
                    Expanded(
                      child: CustomElevatedButton(
                        textDirection: TextDirection.rtl,
                        text: 'مشاركة',
                        onPressed: () {
                          SharePlus.instance.share(
                            ShareParams(
                              title: 'Mzaodin',
                              text: 'check out my website https://example.com',
                            ),
                          );
                        },
                        backgroundColor: R.colors.colorUnSelected,
                        borderRadius: 8.r,
                        heigth: 40.h,
                        textStyle: R.textStyles.font14BlackW500Light.copyWith(
                          color: R.colors.primaryColorLight,
                        ),
                        icon: SvgPicture.asset(
                          R.images.shareIcon,
                          width: 20.w,
                          height: 20.h,
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
