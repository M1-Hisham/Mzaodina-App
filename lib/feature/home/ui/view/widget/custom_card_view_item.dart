import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/app_button.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_cloc_builder_countdown.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_indcator_item.dart';

class CustomCardViewItem extends StatefulWidget {
  const CustomCardViewItem({super.key});

  @override
  State<CustomCardViewItem> createState() => _CustomCardViewItemState();
}

class _CustomCardViewItemState extends State<CustomCardViewItem> {
  DateTime eventTimeFromApi = DateTime.parse('2025-05-01 18:00:00');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: R.colors.whiteLight,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: R.colors.textColorLight),
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
                        CustomBlocBuilderCountdown(eventTime: eventTimeFromApi),
                        SizedBox(height: 12.h),

                        _buildCustomRowItem('السعر بالأسواق', '1,000.00'),
                        _buildCustomRowItem('بداية المزاد', '600.00'),
                        CustomIndcatorItem(),
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
                    child: AppButton(
                      text: 'عرض التفاصيل',
                      onPressed: () {},
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
                    child: AppButton(
                      textDirection: TextDirection.rtl,
                      text: 'مشاركة',
                      onPressed: () {},
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
    );
  }
}

Widget _buildCustomRowItem(String title, String price) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 6.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: R.textStyles.font12primaryW600Light.copyWith(
            color: R.colors.greyColor3,
          ),
        ),
        Spacer(),
        Row(
          children: [
            Text(price, style: R.textStyles.font12primaryW600Light),
            SvgPicture.asset(R.images.riyalImage),
          ],
        ),
      ],
    ),
  );
}
