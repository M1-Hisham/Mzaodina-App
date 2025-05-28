import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_app_bar.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/core/widgets/mazad_details_shimmer.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/model/bid_model.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/model/jaraa_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/ui/view/widgets/bids_dialog.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/ui/view_model/auctions_bidding_history_cubit/auctions_bidding_history_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/ui/view_model/jaraa_show_auction_cubit/jaraa_show_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_card_image_details.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_bloc_builder_countdown.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/ui/view/widgets/custom_jaraa_price_card.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_dialog_taelimat_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_mazad_details.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeDetailsJaraaScreen extends StatelessWidget {
  final JaraaAuction jaraaDetails;

  const HomeDetailsJaraaScreen({super.key, required this.jaraaDetails});

  @override
  Widget build(BuildContext context) {
    DateTime eventTimeFromApi = DateTime.parse(jaraaDetails.endAt);

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
                child: CustomAppBar(title: jaraaDetails.product.nameAr),
              ),
            ),

            BlocBuilder<JaraaShowAuctionCubit, JaraaShowAuctionState>(
              builder: (context, state) {
                if (state is JaraaShowAuctionLoading) {
                  return const MazadDetailsShimmer();
                } else if (state is JaraaShowAuctionErorr) {
                  return Center(
                    child: Text(
                      state.error,
                      style: R.textStyles.font14Grey3W500Light,
                    ),
                  );
                } else if (state is JaraaShowAuctionSuccess) {
                  return Expanded(
                    child: SingleChildScrollView(
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
                              progressColor: R.colors.greenColor,
                              backgroundColor: R.colors.greenColor2,
                            ),
                          ),

                          const SizedBox(height: 8),
                          CustomCardImageDetails(
                            images:
                                state.jaraaShowAuctionMode.data.product.images,
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
                              price: jaraaDetails.product.price.toString(),
                              style: R.textStyles.font14Grey3W500Light,
                              priceStyle: R.textStyles.font14primaryW500Light,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),

                            child: CoustomRowItem(
                              title: 'أعلى مبلغ مزايدة',
                              price: jaraaDetails.product.price.toString(),
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
                          if (state.jaraaShowAuctionMode.data.canBidding)
                            Column(
                              children: [
                                SizedBox(height: 22.h),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),

                                  child: CustomJaraaPriceCard(
                                    slug: state.jaraaShowAuctionMode.data.slug,
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
                                        state.auctionsBiddingHistoryModel.data,
                                      );
                                      showDialog(
                                        context: context,
                                        builder:
                                            (context) => BidsDialog(bids: bids),
                                      );
                                    } else if (state
                                        is AuctionsBiddingHistoryError) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(content: Text(state.error)),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text('جاري تحميل البيانات'),
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
                              jaraaDetails.product.productDetails,
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
      ),
    );
  }
}

// CustomElevatedButton(
//               text: 'Push',
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder:
//                         (_) => WebViewScreen(
//                           url:
//                               'https://checkout.tap.company/?mode=page&themeMode=&language=en&token=eyJhbGciOiJIUzI1NiJ9.eyJpZCI6IjY4MzZjODJlOGE3Y2NkMWQwZGI1ZDI2NSJ9.zq8CMqpiT-rApUczsjB-eQv0z_iTEHgTz_b_GIb249E',
//                         ),
//                   ),
//                 );
//               },
//             ),
// class WebViewScreen extends StatelessWidget {
//   final String url;

//   const WebViewScreen({super.key, required this.url});

//   @override
//   Widget build(BuildContext context) {
//     final controller =
//         WebViewController()
//           ..setJavaScriptMode(JavaScriptMode.unrestricted)
//           // ✅ أضفنا NavigationDelegate هنا
//           ..setNavigationDelegate(
//             NavigationDelegate(
//               onPageStarted: (url) {
//                 log("⏳ بدأ تحميل الصفحة: $url");
//               },
//               onPageFinished: (url) {
//                 log("✅ تم تحميل الصفحة: $url");
//               },
//               onWebResourceError: (error) {
//                 log("❌ حصل خطأ في الويب: ${error.description}");
//               },
//               onNavigationRequest: (NavigationRequest request) {
//                 log("🔁 محاولة التنقل إلى: ${request.url}");
//                 return NavigationDecision.navigate;
//               },
//             ),
//           )
//           ..loadRequest(Uri.parse(url));

//     return Scaffold(
//       appBar: AppBar(title: const Text('صفحة الدفع')),
//       body: WebViewWidget(controller: controller),
//     );
//   }
// }
