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
import 'package:mzaodina_app/feature/action/cubit/action_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/bid_model.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/jaraa_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view/widgets/bids_dialog.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/auctions_bidding_history_cubit/auctions_bidding_history_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/jaraa_show_auction_cubit/jaraa_show_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_card_image_details.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_bloc_builder_countdown.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view/widgets/custom_jaraa_price_card.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_dialog_taelimat_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_mazad_details.dart';
import 'package:mzaodina_app/feature/web-socket/cubit/web_socket_cubit.dart';
import 'package:mzaodina_app/feature/web-socket/cubit/web_socket_state.dart';
import 'package:mzaodina_app/mzaodina_app.dart';

class HomeDetailsOngoingScreen extends StatefulWidget {
  final DateTime eventTimeFromApi;
  final OngoingAuction jaraaDetails;

  const HomeDetailsOngoingScreen({
    super.key,
    required this.jaraaDetails,
    required this.eventTimeFromApi,
  });

  @override
  State<HomeDetailsOngoingScreen> createState() =>
      _HomeDetailsOngoingScreenState();
}

class _HomeDetailsOngoingScreenState extends State<HomeDetailsOngoingScreen>
    with RouteAware {
  late DateTime eventTimeFromApi;
  late WebSocketCubit _webSocketCubit;

  @override
  void initState() {
    super.initState();
    eventTimeFromApi = DateTime.parse(widget.jaraaDetails.endAt);
    _webSocketCubit = context.read<WebSocketCubit>();
    ActionCubit.get(
      context,
    ).connectToAuctionWebSocket(id: widget.jaraaDetails.id.toString());
    // Ensure WebSocket is connected
    if (!_webSocketCubit.isConnected) {
      _webSocketCubit.connect();
    }
  }

  @override
  void didPopNext() {
    BlocProvider.of<AuctionsBiddingHistoryCubit>(
      context,
    ).getAuctionsBiddingHistory(widget.jaraaDetails.slug);
    BlocProvider.of<OngoingShowAuctionCubit>(
      context,
    ).getOngoingShowAuctionCubit(widget.jaraaDetails.slug);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
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
                  title: widget.jaraaDetails.product.nameAr,
                  slug: widget.jaraaDetails.slug,
                ),
              ),
            ),
            BlocBuilder<WebSocketCubit, WebSocketState>(
              builder: (context, wsState) {
                return BlocBuilder<
                  OngoingShowAuctionCubit,
                  OngoingShowAuctionState
                >(
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
                                  widget.jaraaDetails.slug,
                                ),
                      );
                    } else if (state is OngoingShowAuctionSuccess) {
                      return Expanded(
                        child: RefreshIndicator(
                          onRefresh:
                              () => context
                                  .read<OngoingShowAuctionCubit>()
                                  .getOngoingShowAuctionCubit(
                                    widget.jaraaDetails.slug,
                                  ),
                          child: BlocBuilder<ActionCubit, ActionState>(
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
                                              .jaraaShowAuctionMode
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
                                                .jaraaShowAuctionMode
                                                .data
                                                .product
                                                .price
                                                .toString(),
                                        style:
                                            R.textStyles.font14Grey3W500Light,
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
                                            ActionCubit.get(
                                              context,
                                            ).maxBid?.bid.toString() ??
                                            state
                                                .jaraaShowAuctionMode
                                                .data
                                                .maxBid
                                                .bid
                                                .toString(),
                                        style:
                                            R.textStyles.font14Grey3W500Light,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'المزاود',
                                            style:
                                                R
                                                    .textStyles
                                                    .font14Grey3W500Light,
                                          ),
                                          Spacer(),
                                          Text(
                                            ActionCubit.get(
                                                  context,
                                                ).maxBid?.user!.username ??
                                                state
                                                    .jaraaShowAuctionMode
                                                    .data
                                                    .maxBid
                                                    .user
                                                    ?.username ??
                                                '0',
                                            style:
                                                R
                                                    .textStyles
                                                    .font14primaryW500Light,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'الدولة',
                                            style:
                                                R
                                                    .textStyles
                                                    .font14Grey3W500Light,
                                          ),
                                          Spacer(),
                                          Text(
                                            ActionCubit.get(
                                                  context,
                                                ).maxBid?.user!.country ??
                                                state
                                                    .jaraaShowAuctionMode
                                                    .data
                                                    .maxBid
                                                    .user
                                                    ?.country
                                                    .toString() ??
                                                '',
                                            style:
                                                R
                                                    .textStyles
                                                    .font14primaryW500Light,
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
                                                R
                                                    .textStyles
                                                    .font14Grey3W500Light,
                                          ),
                                          Spacer(),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8,
                                              horizontal: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              color: R.colors.greenColor,
                                              borderRadius:
                                                  BorderRadius.circular(99),
                                            ),
                                            child: Text(
                                              'جاري',
                                              style:
                                                  R
                                                      .textStyles
                                                      .font10whiteW500Light,
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
                                            SvgPicture.asset(
                                              R.images.taelimatIcon,
                                            ),
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
                                        .jaraaShowAuctionMode
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
                                                      .jaraaShowAuctionMode
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
                                                      (context) => BidsDialog(
                                                        bids: bids,
                                                      ),
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
                                            .jaraaShowAuctionMode
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
