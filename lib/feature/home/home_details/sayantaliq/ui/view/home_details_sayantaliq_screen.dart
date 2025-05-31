import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_app_bar.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_details_shimmer.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/data/model/sayantaliq_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/ui/view_model/sayantaliq_show_austion_cubit/sayantaliq_show_austion_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_card_image_details.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_dialog_taelimat_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_countdown_unit.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_mazad_details.dart';
import 'package:mzaodina_app/feature/home/ui/view_model/counter_cubit/counter_cubit.dart';
import 'package:mzaodina_app/feature/web-socket/cubit/web_socket_cubit.dart';

class HomeDetailsSayantaliqScreen extends StatelessWidget {
  final DateTime eventTimeFromApi;
  final SayantaliqAuction sayantaliqDetails;
  final int d, h, m, s;
  const HomeDetailsSayantaliqScreen({
    super.key,

    required this.sayantaliqDetails,
    required this.eventTimeFromApi,
    required this.d,
    required this.h,
    required this.m,
    required this.s,
  });

  @override
  Widget build(BuildContext context) {
    DateTime eventTimeFromApi = DateTime.parse(sayantaliqDetails.startAt ?? '');
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: CustomAppBar(title: sayantaliqDetails.product.nameAr),
            ),
          ),

          BlocBuilder<SayantaliqShowAustionCubit, SayantaliqShowAustionState>(
            builder: (context, state) {
              if (state is SayantaliqShowAustionLoading) {
                return const MazadDetailsShimmer();
              } else if (state is SayantaliqShowAustionErorr) {
                return Center(
                  child: Text(
                    state.error,
                    style: R.textStyles.font14Grey3W500Light,
                  ),
                );
              } else if (state is SayantaliqShowAustionSuccess) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.w,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: CountdownUnitWidget(
                                  value: s,
                                  label: 'ثانية',
                                  maxValue: 60,
                                  progressColor: R.colors.orangeColor,
                                  backgroundColor: R.colors.orangeColor2,
                                ),
                              ),
                              Expanded(
                                child: CountdownUnitWidget(
                                  value: m,
                                  label: 'دقيقة',
                                  maxValue: 60,
                                  progressColor: R.colors.orangeColor,
                                  backgroundColor: R.colors.orangeColor2,
                                ),
                              ),
                              Expanded(
                                child: CountdownUnitWidget(
                                  value: h,
                                  maxValue: 24,
                                  label: 'ساعة',
                                  progressColor: R.colors.orangeColor,
                                  backgroundColor: R.colors.orangeColor2,
                                ),
                              ),
                              Expanded(
                                child: CountdownUnitWidget(
                                  value: d,
                                  label: 'يوم',
                                  maxValue: 365,
                                  progressColor: R.colors.orangeColor,
                                  backgroundColor: R.colors.orangeColor2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomCardImageDetails(
                          images:
                              state
                                  .sayantaliqShowAuctionMode
                                  .data
                                  .product
                                  .images,
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
                            price:
                                (double.tryParse(
                                      sayantaliqDetails.product.price
                                          .toString(),
                                    )?.toStringAsFixed(2) ??
                                    sayantaliqDetails.product.price.toString()),
                            style: R.textStyles.font14Grey3W500Light,
                            priceStyle: R.textStyles.font14primaryW500Light,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),

                          child: CoustomRowItem(
                            title: ' بداية المزاد',
                            price: (sayantaliqDetails.openingAmount
                                .toStringAsFixed(2)),
                            style: R.textStyles.font14Grey3W500Light,
                            priceStyle: R.textStyles.font14primaryW500Light,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          color: R.colors.blackColor2,
                          child: CoustomRowItem(
                            title: 'رسوم تنظيم',
                            price:
                                (sayantaliqDetails.registrationAmount
                                    ?.toStringAsFixed(2)) ??
                                '0.00',
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
                                create:
                                    (_) => CounterCubit(
                                      eventTime: eventTimeFromApi,
                                      getNow: () {
                                        final cubit =
                                            context.read<WebSocketCubit>();
                                        try {
                                          return cubit.latestServerTime != null
                                              ? DateTime.parse(
                                                cubit.latestServerTime!,
                                              )
                                              : DateTime.now();
                                        } catch (_) {
                                          return DateTime.now();
                                        }
                                      },
                                    ),
                                child: BlocBuilder<CounterCubit, CounterState>(
                                  builder: (context, state) {
                                    if (state is CountdownRunning) {
                                      return Text(
                                        '${state.hours}:${state.minutes}:${state.seconds}',
                                        style:
                                            R.textStyles.font16primaryW600Light,
                                      );
                                    } else {
                                      return Text(
                                        '00:00:00',
                                        style:
                                            R.textStyles.font16primaryW600Light,
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
                          child: HtmlWidget(
                            sayantaliqDetails.product.productDetails,
                            textStyle: R.textStyles.font12Grey3W500Light,
                          ),
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
