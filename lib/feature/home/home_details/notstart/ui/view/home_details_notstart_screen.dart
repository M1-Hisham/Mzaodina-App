import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_app_bar.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_details_shimmer.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/qadim_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view/widget/custom_verification_to_register_auction_botton.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_card_image_details.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_dialog_taelimat_item.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/qadim_show_auction_cubit/qadim_show_action_cubit.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_indcator_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_mazad_details.dart';
import 'package:mzaodina_app/feature/profile/view_model/auction_terms_cubit/auction_terms_cubit.dart';
import 'package:mzaodina_app/mzaodina_app.dart';

class HomeDetailsNotstartScreen extends StatefulWidget {
  final NotstartAuction qadimDetails;
  const HomeDetailsNotstartScreen({super.key, required this.qadimDetails});

  @override
  State<HomeDetailsNotstartScreen> createState() =>
      _HomeDetailsNotstartScreenState();
}

class _HomeDetailsNotstartScreenState extends State<HomeDetailsNotstartScreen>
    with RouteAware {
  @override
  void didPopNext() {
    BlocProvider.of<NotstartShowActionCubit>(
      context,
    ).getShowAction(widget.qadimDetails.slug);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // تسجيل الصفحة في RouteObserver
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    // دايمًا لازم تلغي التسجيل
    routeObserver.unsubscribe(this);
    super.dispose();
  }

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
                title: widget.qadimDetails.product.nameAr,
                slug: widget.qadimDetails.slug,
              ),
            ),
          ),

          BlocBuilder<NotstartShowActionCubit, NotstartShowActionState>(
            builder: (context, state) {
              if (state is NotstartShowActionLoading) {
                return const MazadDetailsShimmer();
              } else if (state is NotstartShowActionError) {
                return Center(
                  child: Text(
                    state.message,
                    style: R.textStyles.font14Grey3W500Light,
                  ),
                );
              } else if (state is NotstartShowActionSuccess) {
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh:
                        () => context
                            .read<NotstartShowActionCubit>()
                            .getShowAction(widget.qadimDetails.slug),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),

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
                              value:
                                  state.showActionModel.data.auctionStartRate
                                      .round(),
                            ),
                          ),

                          const SizedBox(height: 8),
                          Hero(
                            tag: state.showActionModel.data.slug,
                            child: CustomCardImageDetails(
                              images: state.showActionModel.data.product.images,
                            ),
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
                                  state.showActionModel.data.product.price
                                      .toString(),
                              style: R.textStyles.font14Grey3W500Light,
                              priceStyle: R.textStyles.font14primaryW500Light,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),

                            child: CoustomRowItem(
                              title: ' بداية المزاد',
                              price: state.showActionModel.data.openingAmount
                                  .toStringAsFixed(2),
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
                              price: state
                                  .showActionModel
                                  .data
                                  .registrationAmount
                                  .toStringAsFixed(2),
                              style: R.textStyles.font14Grey3W500Light,
                              priceStyle: R.textStyles.font14primaryW500Light,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),

                            child: CustomIndcatorItem(
                              title: 'انطلاق المزاد',
                              showIndicator: false,
                              style: R.textStyles.font14Grey3W500Light,
                              value:
                                  state.showActionModel.data.auctionStartRate
                                      .round(),
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                          
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(R.images.taelimatIcon),
                                    const SizedBox(width: 8),
                                    Text(
                                      'تعليمات المزاد',
                                      style:
                                          R.textStyles.font16primaryW600Light,
                                    ),
                                  ],
                                ),
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
                              widget.qadimDetails.product.productDetails,
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

      bottomNavigationBar: CustomVerificationToRegisterAuctionBotton(
        slug: widget.qadimDetails.slug,
        showActionCubit: context.read<NotstartShowActionCubit>(),
      ),
    );
  }
}
