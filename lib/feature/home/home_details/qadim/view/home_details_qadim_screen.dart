import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_app_bar.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_card_image_details.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_dialog_taelimat_item.dart';
import 'package:mzaodina_app/feature/home/join-auction/view/join_the_auction.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_indcator_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_mazad_details.dart';

class HomeDetailsQadimScreen extends StatelessWidget {
  const HomeDetailsQadimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: CustomAppBar(title: 'مزاد على ايفون 16 برو من ابل'),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 41,
                      vertical: 8,
                    ),
                    child: CustomIndcatorItem(
                      title: 'نسبة انطلاق المزاد',
                      showIndicator: true,
                    ),
                  ),

                  const SizedBox(height: 8),
                  CustomCardImageDetails(
                    images: [
                      R.images.phoneImagePng,
                      R.images.phoneImagePng1,
                      R.images.phoneImagePng2,
                      R.images.phoneImagePng3,
                      R.images.phoneImagePng4,
                    ],
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),

                    child: CustomTextMazadDetails(title: 'تفاصيل المزاد'),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    color: R.colors.blackColor2,

                    child: CoustomRowItem(
                      title: 'سعر المنتج بالأسواق',
                      price: '1000.00 ',
                      style: R.textStyles.font14Grey3W500Light,
                      priceStyle: R.textStyles.font14primaryW500Light,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),

                    child: CoustomRowItem(
                      title: ' بداية المزاد',
                      price: '600.00 ',
                      style: R.textStyles.font14Grey3W500Light,
                      priceStyle: R.textStyles.font14primaryW500Light,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    color: R.colors.blackColor2,

                    child: CoustomRowItem(
                      title: 'رسوم تنظيم',
                      price: '30.00 ',
                      style: R.textStyles.font14Grey3W500Light,
                      priceStyle: R.textStyles.font14primaryW500Light,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),

                    child: CustomIndcatorItem(
                      title: 'انطلاق المزاد',
                      showIndicator: false,
                      style: R.textStyles.font14Grey3W500Light,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    color: R.colors.blackColor2,

                    child: Row(
                      children: [
                        Text(
                          'الحالة',
                          style: R.textStyles.font14Grey3W500Light,
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: R.colors.primaryColorLight,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Text(
                            'قادم',
                            style: R.textStyles.font10whiteW500Light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 22.h),
                  InkWell(
                    onTap:
                        () => showDialog<String>(
                          context: context,
                          builder:
                              (BuildContext context) =>
                                  CustomDialogTaelimatItem(),
                        ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),

                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            SvgPicture.asset(R.images.taelimatIcon),
                            const SizedBox(width: 8),
                            Text(
                              'تعليمات المزاد',
                              style: R.textStyles.font16primaryW600Light,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),

                    child: CustomTextMazadDetails(title: 'تفاصيل المنتج'),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          tafasilAlmazad
                              .map((text) => CustomTextItem(text: text))
                              .toList(),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
        child: CustomElevatedButton(
          text: 'الانضمام للمزاد',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const JoinTheAuction()),
            );
          },
        ),
      ),
    );
  }
}
