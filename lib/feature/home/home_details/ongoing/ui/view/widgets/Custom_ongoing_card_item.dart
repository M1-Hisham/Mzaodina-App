import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/auction/cubit/auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/ongoing_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_bloc_builder_countdown.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ntp/ntp.dart'; // ✅ تمت الإضافة

class CustomOngoingCardViewItem extends StatefulWidget {
  final OngoingAuction ongoingDataModel;

  const CustomOngoingCardViewItem({
    super.key,
    required this.ongoingDataModel,
  });

  @override
  State<CustomOngoingCardViewItem> createState() =>
      _CustomOngoingCardViewItemState();
}

class _CustomOngoingCardViewItemState extends State<CustomOngoingCardViewItem> {
  late final DateTime eventTimeFromApi;
  DateTime? currentNetworkTime;

  @override
  void initState() {
    super.initState();
    eventTimeFromApi = DateTime.parse(widget.ongoingDataModel.endAt);
    _getAccurateTime();
  }

  Future<void> _getAccurateTime() async {
    try {
      final now = await NTP.now();
      setState(() => currentNetworkTime = now);
    } catch (_) {
      setState(() => currentNetworkTime = DateTime.now()); // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: R.colors.whiteLight,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: R.colors.whiteColor2),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.ongoingDataModel.slug,
                  child: CachedNetworkImage(
                    imageUrl: widget.ongoingDataModel.product.images.first,
                    width: 120.w,
                    height: 158.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Text(
                          widget.ongoingDataModel.product.nameAr,
                          style: R.textStyles.font16BlackW500Light,
                        ),
                      ),
                      SizedBox(height: 12.h),

                      // ✅ الكاونتر بناء على توقيت الإنترنت
                      if (currentNetworkTime != null)
                        OngoingCountdown(
                          eventTime: eventTimeFromApi,
                          getNow: () => currentNetworkTime!,
                          progressColor: R.colors.greenColor2,
                          backgroundColor: R.colors.greenColor,
                        )
                      else
                        const Center(child: CircularProgressIndicator()),

                      SizedBox(height: 12.h),
                      CoustomRowItem(
                        title: 'السعر بالأسواق',
                        price: widget.ongoingDataModel.product.price.toString(),
                      ),
                      CoustomRowItem(
                        title: 'أعلى مزاد',
                        price: widget.ongoingDataModel.maxBid.bid.toStringAsFixed(2),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        child: Row(
                          children: [
                            Text(
                              'المزاود',
                              style: R.textStyles.font12Grey3W500Light,
                            ),
                            const Spacer(),
                            Text(
                              widget.ongoingDataModel.maxBid.user.username,
                              style: R.textStyles.font16primaryW600Light,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomElevatedButton(
                    text: 'عرض التفاصيل',
                    onPressed: () {
                      // لم نعد بحاجة لفصل/ربط الويب سوكيت هنا
                      AuctionCubit.get(context).auctionState(
                        id: widget.ongoingDataModel.id.toString(),
                        state: "finished",
                      );
                      Navigator.pushNamed(
                        context,
                        AppRoutes.homeDetailsOngoingScreenRoute,
                        arguments: {
                          'eventTime': eventTimeFromApi,
                          'jaraaDataModel': widget.ongoingDataModel,
                        },
                      );
                    },
                    backgroundColor: R.colors.primaryColorLight,
                    borderRadius: 8.r,
                    heigth: 40.h,
                    textStyle: R.textStyles.font12GreyW500Light.copyWith(
                      color: R.colors.whiteLight,
                    ),
                  ),
                ),
                SizedBox(width: 11.w),
                Expanded(
                  child: CustomElevatedButton(
                    text: 'مشاركة',
                    textDirection: TextDirection.rtl,
                    onPressed: () {
                      SharePlus.instance.share(
                        ShareParams(
                          title: 'Mzaodin',
                          text: 'mzaodin.sa/auction/${widget.ongoingDataModel.slug}',
                        ),
                      );
                    },
                    backgroundColor: R.colors.colorUnSelected,
                    borderRadius: 8.r,
                    heigth: 40.h,
                    textStyle: R.textStyles.font14BlackW500Light.copyWith(
                      color: R.colors.primaryColorLight,
                    ),
                    icon: SvgPicture.asset(
                      R.images.shareIcon,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
