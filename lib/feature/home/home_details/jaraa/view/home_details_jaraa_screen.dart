import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_app_bar.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/view/widgets/bids_dialog.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_card_image_details.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_bloc_builder_countdown.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/view/widgets/custom_jaraa_price_card.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_dialog_taelimat_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_mazad_details.dart';

class HomeDetailsJaraaScreen extends StatelessWidget {
  final DateTime eventTimeFromApi;
  HomeDetailsJaraaScreen({super.key, required this.eventTimeFromApi});
  final List<Bid> bids = List.generate(
    10,
    (index) => Bid(
      number: index + 1,
      name: 'مزايد ${index + 1}',
      amount: 1200,
      dateTime: DateTime(2025, 4, 18, 15, 25),
    ),
  );
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.w,
                      vertical: 12,
                    ),
                    child: CustomBlocBuilderCountdown(
                      eventTime: eventTimeFromApi,
                      progressColor: R.colors.greenColor,
                      backgroundColor: R.colors.greenColor2,
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),

                    child: CoustomRowItem(
                      title: 'أعلى مبلغ مزايدة',
                      price: '600.00 ',
                      style: R.textStyles.font14Grey3W500Light,
                      priceStyle: R.textStyles.font14primaryW500Light,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 6.h,
                      horizontal: 16,
                    ),
                    color: R.colors.blackColor2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'المزاود',
                          style: R.textStyles.font14Grey3W500Light,
                        ),
                        Spacer(),
                        Text(
                          'لم يزايد احد',
                          style: R.textStyles.font14primaryW500Light,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 6.h,
                      horizontal: 16,
                    ),
                    color: R.colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'الدولة',
                          style: R.textStyles.font14Grey3W500Light,
                        ),
                        Spacer(),
                        Text(
                          'لا يوجد',
                          style: R.textStyles.font14primaryW500Light,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: R.colors.blackColor2,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),

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
                            color: R.colors.greenColor,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Text(
                            'جاري',
                            style: R.textStyles.font10whiteW500Light,
                          ),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap:
                        () => showDialog<String>(
                          context: context,
                          builder:
                              (BuildContext context) =>
                                  CustomDialogTaelimatItem(),
                        ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
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
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),

                    child: CustomJaraaPriceCard(),
                  ),

                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),

                    child: CustomElevatedButton(
                      text: 'سجل المزايدة',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => BidsDialog(bids: bids),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),

                    child: CustomTextMazadDetails(title: 'تفاصيل المنتج'),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        tafasilAlmazad
                            .map(
                              (text) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),

                                child: CustomTextItem(text: text),
                              ),
                            )
                            .toList(),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
