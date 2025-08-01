import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_app_bar.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_erorr_widget.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_details_shimmer.dart';
import 'package:mzaodina_app/feature/home/home_details/data/model/home_details_model.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/bid_model.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view/widgets/bids_dialog.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/auctions_bidding_history_cubit/auctions_bidding_history_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/model/finished_auctions_response.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/ui/view_model/finished_show_auction_cubit/finished_show_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_card_image_details.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_mazad_details.dart';

class HomeDetailsFinishedScreen extends StatelessWidget {
  final UnifiedAuction finishedDetails;
  const HomeDetailsFinishedScreen({super.key, required this.finishedDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: CustomAppBar(
                title: finishedDetails.product?.nameAr ?? '',
                slug: finishedDetails.slug,
              ),
            ),
          ),
          BlocBuilder<FinishedShowAuctionCubit, FinishedShowAuctionState>(
            builder: (context, state) {
              if (state is FinishedShowAuctionLoading) {
                return const MazadDetailsShimmer();
              } else if (state is FinishedShowAuctionError) {
                return CustomErorrWidget(
                  message: state.message,
                  onRefresh:
                      () => context
                          .read<FinishedShowAuctionCubit>()
                          .getFinishedShowAuction(finishedDetails.slug),
                );
              } else if (state is FinishedShowAuctionSuccess) {
                final data = state.model.data;
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh:
                        () => context
                            .read<FinishedShowAuctionCubit>()
                            .getFinishedShowAuction(finishedDetails.slug),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCardImageDetails(images: data.product.images),
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
                              price: data.product.price.toString(),
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
                                  'مبلغ ترسية المزاد',
                                  style: R.textStyles.font14Grey3W500Light,
                                ),
                                Spacer(),
                                Text(
                                  data.winner.invoicePrice,
                                  style: R.textStyles.font12primaryW600Light,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 6.h,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: R.colors.blackColor2,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'المزاود',
                                  style: R.textStyles.font14Grey3W500Light,
                                ),
                                Spacer(),
                                Text(
                                  data.winner.user.username,
                                  style: R.textStyles.font12primaryW600Light,
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
                                  data.winner.user.country,
                                  style: R.textStyles.font12primaryW600Light,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: R.colors.blackColor2,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),

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
                                    color: R.colors.redColor,
                                    borderRadius: BorderRadius.circular(99),
                                  ),
                                  child: Text(
                                    'منتهي',
                                    style: R.textStyles.font10whiteW500Light,
                                  ),
                                ),
                              ],
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
                          SizedBox(height: 12.h),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: HtmlWidget(
                              finishedDetails.product!.productDetails,
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

      bottomNavigationBar:
          BlocBuilder<AuctionsBiddingHistoryCubit, AuctionsBiddingHistoryState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: CustomElevatedButton(
                  backgroundColor: R.colors.redColor,
                  text: 'سجل المزايدات',
                  onPressed: () {
                    if (state is AuctionsBiddingHistorySuccess) {
                      final bids = convertToBids(
                        state.auctionsBiddingHistoryModel.data,
                      );
                      showDialog(
                        context: context,
                        builder: (context) => BidsDialog(bids: bids),
                      );
                    } else if (state is AuctionsBiddingHistoryError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('جاري تحميل البيانات')),
                      );
                    }
                  },
                ),
              );
            },
          ),
    );
  }
}
