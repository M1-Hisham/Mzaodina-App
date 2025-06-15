import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_app_bar.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_details_shimmer.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/ready_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view_model/ready_show_austion_cubit/ready_show_austion_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_card_image_details.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_dialog_taelimat_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_countdown_unit.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_mazad_details.dart';
import 'package:mzaodina_app/feature/home/ui/view_model/counter_cubit/counter_cubit.dart';
import 'package:mzaodina_app/feature/web-socket/cubit/web_socket_cubit.dart';

class HomeDetailsReadyScreen extends StatelessWidget {
  final DateTime eventTimeFromApi;
  final ReadyAuction readyDetails;
  final int d, h, m, s;
  const HomeDetailsReadyScreen({
    super.key,

    required this.readyDetails,
    required this.eventTimeFromApi,
    required this.d,
    required this.h,
    required this.m,
    required this.s,
  });

  @override
  Widget build(BuildContext context) {
    DateTime eventTimeFromApi = DateTime.parse(readyDetails.startAt ?? '');
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: CustomAppBar(
                title: readyDetails.product.nameAr,
                slug: readyDetails.slug,
              ),
            ),
          ),

          BlocBuilder<ReadyShowAustionCubit, ReadyShowAustionState>(
            builder: (context, state) {
              if (state is ReadyShowAustionLoading) {
                return const MazadDetailsShimmer();
              } else if (state is ReadyShowAustionErorr) {
                return Center(
                  child: Text(
                    state.error,
                    style: R.textStyles.font14Grey3W500Light,
                  ),
                );
              } else if (state is ReadyShowAustionSuccess) {
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh:
                        () => context
                            .read<ReadyShowAustionCubit>()
                            .getReadyShowAuctionCubit(readyDetails.slug),
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
                                state.readyShowAuctionMode.data.product.images,
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),

                            child: CustomTextMazadDetails(
                              title: 'تفاصيل المزاد',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            color: R.colors.blackColor2,
                            child: CoustomRowItem(
                              title: 'سعر المنتج بالأسواق',
                              price:
                                  (double.tryParse(
                                        state
                                            .readyShowAuctionMode
                                            .data
                                            .product
                                            .price
                                            .toString(),
                                      )?.toStringAsFixed(2) ??
                                      state
                                          .readyShowAuctionMode
                                          .data
                                          .product
                                          .price
                                          .toString()),
                              style: R.textStyles.font14Grey3W500Light,
                              priceStyle: R.textStyles.font14primaryW500Light,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),

                            child: CoustomRowItem(
                              title: ' بداية المزاد',
                              price: (state
                                  .readyShowAuctionMode
                                  .data
                                  .openingAmount
                                  .toStringAsFixed(2)),
                              style: R.textStyles.font14Grey3W500Light,
                              priceStyle: R.textStyles.font14primaryW500Light,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            color: R.colors.blackColor2,
                            child: CoustomRowItem(
                              title: 'رسوم تنظيم',
                              price: (state
                                  .readyShowAuctionMode
                                  .data
                                  .registrationAmount
                                  .toStringAsFixed(2)),

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
                                            return cubit.latestServerTime !=
                                                    null
                                                ? DateTime.parse(
                                                  cubit.latestServerTime!,
                                                )
                                                : DateTime.now();
                                          } catch (_) {
                                            return DateTime.now();
                                          }
                                        },
                                      ),
                                  child: BlocBuilder<
                                    CounterCubit,
                                    CounterState
                                  >(
                                    builder: (context, state) {
                                      if (state is CountdownRunning) {
                                        return Text(
                                          '${state.hours}:${state.minutes}:${state.seconds}',
                                          style:
                                              R
                                                  .textStyles
                                                  .font16primaryW600Light,
                                        );
                                      } else {
                                        return Text(
                                          '00:00:00',
                                          style:
                                              R
                                                  .textStyles
                                                  .font16primaryW600Light,
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),

                            child: CustomTextMazadDetails(
                              title: 'تفاصيل المنتج',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: HtmlWidget(
                              state
                                  .readyShowAuctionMode
                                  .data
                                  .product
                                  .productDetails,
                              textStyle: R.textStyles.font12Grey3W500Light,
                            ),
                          ),
                          const SizedBox(height: 80),
                        ],
                      ),
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
