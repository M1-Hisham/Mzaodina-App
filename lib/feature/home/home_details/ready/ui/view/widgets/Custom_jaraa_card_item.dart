
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/jaraa_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_bloc_builder_countdown.dart';
import 'package:mzaodina_app/feature/web-socket/cubit/web_socket_cubit.dart';
import 'package:share_plus/share_plus.dart';

class CustomJaraaCardViewItem extends StatefulWidget {
  final JaraaAuction jaraaDataModel;

  const CustomJaraaCardViewItem({super.key, required this.jaraaDataModel});

  @override
  State<CustomJaraaCardViewItem> createState() =>
      _CustomJaraaCardViewItemState();
}

class _CustomJaraaCardViewItemState extends State<CustomJaraaCardViewItem> {
  @override
  Widget build(BuildContext context) {
    DateTime eventTimeFromApi = DateTime.parse(widget.jaraaDataModel.endAt);
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
                  tag: widget.jaraaDataModel.slug,
                  child: CachedNetworkImage(
                    imageUrl: widget.jaraaDataModel.product.images.first,
                    width: 120.w,
                    height: 158.h,
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
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
                          widget.jaraaDataModel.product.nameAr,
                          style: R.textStyles.font16BlackW500Light,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      BlocProvider(
                        create: (_) => WebSocketCubit(),
                        child: CustomBlocBuilderCountdown(
                          eventTime: eventTimeFromApi,
                          getNow: () {
                            final cubit = context.read<WebSocketCubit>();
                            try {
                              return cubit.latestServerTime != null
                                  ? DateTime.parse(cubit.latestServerTime!)
                                  : DateTime.now();
                            } catch (_) {
                              return DateTime.now();
                            }
                          },
                          progressColor: R.colors.greenColor,
                          backgroundColor: R.colors.greenColor2,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      CoustomRowItem(
                        title: 'السعر بالأسواق',
                        price: widget.jaraaDataModel.product.price.toString(),
                      ),
                      CoustomRowItem(
                        title: 'أعلى مزاد',
                        price: widget.jaraaDataModel.maxBid.bid.toStringAsFixed(
                          2,
                        ),
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
                              widget.jaraaDataModel.maxBid.user.username,
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
                      Navigator.pushNamed(
                        context,
                        AppRoutes.homeDetailsJaraaScreenRoute,
                        arguments: {
                          'eventTime': eventTimeFromApi,
                          'jaraaDataModel': widget.jaraaDataModel,
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
                          text:
                              'mzaodin.sa/auction/${widget.jaraaDataModel.slug}',
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
