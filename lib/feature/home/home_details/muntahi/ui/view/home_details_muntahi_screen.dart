import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_app_bar.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_details_shimmer.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/model/bid_model.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/ui/view/widgets/bids_dialog.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/ui/view_model/auctions_bidding_history_cubit/auctions_bidding_history_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/muntahi/data/model/muntahi_auctions_response.dart';
import 'package:mzaodina_app/feature/home/home_details/muntahi/ui/view_model/muntahi_shoe_auction_cubit/muntahi_show_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_card_image_details.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_mazad_details.dart';

class HomeDetailsMuntahiScreen extends StatelessWidget {
  final MuntahiAction muntahiDetails;
  const HomeDetailsMuntahiScreen({super.key, required this.muntahiDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: CustomAppBar(title: muntahiDetails.product.nameAr),
            ),
          ),
          BlocBuilder<MuntahiShowAuctionCubit, MuntahiShowAuctionState>(
            builder: (context, state) {
              if (state is MuntahiShowAuctionLoading) {
                return const MazadDetailsShimmer();
              } else if (state is MuntahiShowAuctionError) {
                return Center(
                  child: Text(
                    state.message,
                    style: R.textStyles.font14Grey3W500Light,
                  ),
                );
              } else if (state is MuntahiShowAuctionSuccess) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCardImageDetails(
                          images: muntahiDetails.product.images,
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
                            price: muntahiDetails.product.price.toString(),
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
                                'انتظار دفع الفاتورة',
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
                                muntahiDetails.winner.user.username,
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
                                'لايوجد',
                                style: R.textStyles.font12primaryW600Light,
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
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),

                          child: CustomTextMazadDetails(title: 'تفاصيل المنتج'),
                        ),
                        SizedBox(height: 12.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: HtmlWidget(
                            muntahiDetails.product.productDetails,
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
