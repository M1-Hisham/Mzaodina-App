import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_app_bar.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_card_image_details.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_bloc_builder_countdown.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_dialog_taelimat_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_mazad_details.dart';
import 'package:mzaodina_app/feature/home/ui/view_model/counter_cubit/counter_cubit.dart';

class HomeDetailsSayantaliqScreen extends StatelessWidget {
  final DateTime eventTimeFromApi;
  const HomeDetailsSayantaliqScreen({
    super.key,
    required this.eventTimeFromApi,
  });

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
                      progressColor: R.colors.orangeColor,
                      backgroundColor: R.colors.orangeColor2,
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
                          'انطلاق المزاد',
                          style: R.textStyles.font12Grey3W500Light,
                        ),
                        Spacer(),
                        BlocProvider(
                          create: (_) => CounterCubit(eventTimeFromApi),
                          child: BlocBuilder<CounterCubit, CounterState>(
                            builder: (context, state) {
                              if (state is CountdownRunning) {
                                return Text(
                                  '0${state.hours}:${state.minutes}:${state.seconds}',
                                  style: R.textStyles.font16primaryW600Light,
                                );
                              } else {
                                return Text(
                                  '00:00:00',
                                  style: R.textStyles.font16primaryW600Light,
                                );
                              }
                            },
                          ),
                        ),
                      ],
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
                            color: R.colors.orangeColor,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Text(
                            'فى انتظار البدء',
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
    );
  }
}
