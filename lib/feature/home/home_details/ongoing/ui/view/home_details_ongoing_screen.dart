import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_app_bar.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_erorr_widget.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_details_shimmer.dart';
import 'package:mzaodina_app/feature/auction/cubit/auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/bid_model.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/ongoing_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view/widgets/bids_dialog.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/auctions_bidding_history_cubit/auctions_bidding_history_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/ongoing_show_auction_cubit/ongoing_show_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_card_image_details.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_bloc_builder_countdown.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view/widgets/custom_ongoing_price_card.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_dialog_taelimat_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_mazad_details.dart';
import 'package:mzaodina_app/feature/web-socket/cubit/web_socket_cubit.dart';

class HomeDetailsOngoingScreen extends StatefulWidget {
  final DateTime eventTimeFromApi;
  final OngoingAuction ongoingDetails;

  const HomeDetailsOngoingScreen({
    super.key,
    required this.ongoingDetails,
    required this.eventTimeFromApi,
  });

  @override
  State<HomeDetailsOngoingScreen> createState() =>
      _HomeDetailsOngoingScreenState();
}

class _HomeDetailsOngoingScreenState extends State<HomeDetailsOngoingScreen> {
  late DateTime eventTimeFromApi;
  late WebSocketCubit _webSocketCubit;

  @override
  void initState() {
    AuctionCubit.get(
      context,
    ).connectToAuctionWebSocket(id: widget.ongoingDetails.id.toString());
    super.initState();
    eventTimeFromApi = DateTime.parse(widget.ongoingDetails.endAt);
    _webSocketCubit = context.read<WebSocketCubit>();
    AuctionCubit.get(
      context,
    ).connectToAuctionWebSocket(id: widget.ongoingDetails.id.toString());
    // Ensure WebSocket is connected
    if (!_webSocketCubit.isConnected) {
      _webSocketCubit.connect();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: R.colors.whiteLight,
        body: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: CustomAppBar(
                  title: widget.ongoingDetails.product.nameAr,
                  slug: widget.ongoingDetails.slug,
                ),
              ),
            ),
            BlocBuilder<OngoingShowAuctionCubit, OngoingShowAuctionState>(
              builder: (context, state) {
                if (state is OngoingShowAuctionLoading) {
                  return const MazadDetailsShimmer();
                } else if (state is OngoingShowAuctionErorr) {
                  return CustomErorrWidget(
                    message: 'اسحب لاعمل ريفريش',
                    onRefresh:
                        () => context
                            .read<OngoingShowAuctionCubit>()
                            .getOngoingShowAuctionCubit(
                              widget.ongoingDetails.slug,
                            ),
                  );
                } else if (state is OngoingShowAuctionSuccess) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh:
                          () => context
                              .read<OngoingShowAuctionCubit>()
                              .getOngoingShowAuctionCubit(
                                widget.ongoingDetails.slug,
                              ),
                      child: BlocBuilder<AuctionCubit, AuctionState>(
                        builder: (context, statee) {
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 35.w,
                                    vertical: 12.h,
                                  ),
                                  child: CustomBlocBuilderCountdown(
                                    eventTime: eventTimeFromApi,
                                    getNow:
                                        () =>
                                            _webSocketCubit
                                                .getCurrentServerTime(),
                                    progressColor: R.colors.greenColor,
                                    backgroundColor: R.colors.greenColor2,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                CustomCardImageDetails(
                                  images:
                                      state
                                          .ongoingShowAuctionMode
                                          .data
                                          .product
                                          .images,
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
                                        state
                                            .ongoingShowAuctionMode
                                            .data
                                            .product
                                            .price
                                            .toString(),
                                    style: R.textStyles.font14Grey3W500Light,
                                    priceStyle:
                                        R.textStyles.font14primaryW500Light,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),

                                  child: CoustomRowItem(
                                    title: 'أعلى مبلغ مزايدة',
                                    price:
                                        AuctionCubit.get(
                                          context,
                                        ).maxBid?.bid?.toStringAsFixed(2) ??
                                        state
                                            .ongoingShowAuctionMode
                                            .data
                                            .maxBid
                                            .bid
                                            ?.toStringAsFixed(2) ??
                                        '0.00',
                                    style: R.textStyles.font14Grey3W500Light,
                                    priceStyle:
                                        R.textStyles.font14primaryW500Light,
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
                                        style:
                                            R.textStyles.font14Grey3W500Light,
                                      ),
                                      Spacer(),
                                      Text(
                                        AuctionCubit.get(
                                              context,
                                            ).maxBid?.user!.username ??
                                            state
                                                .ongoingShowAuctionMode
                                                .data
                                                .maxBid
                                                .user
                                                ?.username ??
                                            '0',
                                        style:
                                            R.textStyles.font14primaryW500Light,
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
                                        style:
                                            R.textStyles.font14Grey3W500Light,
                                      ),
                                      Spacer(),
                                      Text(
                                        AuctionCubit.get(
                                              context,
                                            ).maxBid?.user!.country ??
                                            state
                                                .ongoingShowAuctionMode
                                                .data
                                                .maxBid
                                                .user
                                                ?.country
                                                .toString() ??
                                            '',
                                        style:
                                            R.textStyles.font14primaryW500Light,
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
                                        style:
                                            R.textStyles.font14Grey3W500Light,
                                      ),
                                      Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          color: R.colors.greenColor,
                                          borderRadius: BorderRadius.circular(
                                            99,
                                          ),
                                        ),
                                        child: Text(
                                          'جاري',
                                          style:
                                              R.textStyles.font10whiteW500Light,
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
                                          style:
                                              R
                                                  .textStyles
                                                  .font16primaryW600Light,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (state
                                    .ongoingShowAuctionMode
                                    .data
                                    .canBidding)
                                  Column(
                                    children: [
                                      SizedBox(height: 22.h),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                        ),

                                        child: CustomOngoingPriceCard(
                                          slug:
                                              state
                                                  .ongoingShowAuctionMode
                                                  .data
                                                  .slug,
                                        ),
                                      ),
                                    ],
                                  ),

                                const SizedBox(height: 8),
                                BlocBuilder<
                                  AuctionsBiddingHistoryCubit,
                                  AuctionsBiddingHistoryState
                                >(
                                  builder: (context, state) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                      ),
                                      child: CustomElevatedButton(
                                        text: 'سجل المزايدات',
                                        onPressed: () {
                                          if (state
                                              is AuctionsBiddingHistorySuccess) {
                                            final bids = convertToBids(
                                              state
                                                  .auctionsBiddingHistoryModel
                                                  .data,
                                            );
                                            showDialog(
                                              context: context,
                                              builder:
                                                  (context) =>
                                                      BidsDialog(bids: bids),
                                            );
                                          } else if (state
                                              is AuctionsBiddingHistoryError) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(state.error),
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'جاري تحميل البيانات',
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    );
                                  },
                                ),

                                const SizedBox(height: 12),
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
                                        .ongoingShowAuctionMode
                                        .data
                                        .product
                                        .productDetails,
                                    textStyle:
                                        R.textStyles.font12Grey3W500Light,
                                  ),
                                ),
                                const SizedBox(height: 80),
                              ],
                            ),
                          );
                        },
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
      ),
    );
  }
}
