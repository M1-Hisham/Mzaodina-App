import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/data/model/sayantaliq_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_bloc_builder_countdown.dart';
import 'package:mzaodina_app/feature/home/ui/view_model/counter_cubit/counter_cubit.dart';
import 'package:share_plus/share_plus.dart';

class CustomSayantaliqCardViewItem extends StatefulWidget {
  final SayantaliqAuction sayantaliqDataModel;
  const CustomSayantaliqCardViewItem({
    super.key,
    required this.sayantaliqDataModel,
  });

  @override
  State<CustomSayantaliqCardViewItem> createState() =>
      _CustomQadimCardViewItemState();
}

class _CustomQadimCardViewItemState
    extends State<CustomSayantaliqCardViewItem> {
  @override
  Widget build(BuildContext context) {
    DateTime eventTimeFromApi = DateTime.parse(
      widget.sayantaliqDataModel.startAt ?? DateTime.now().toIso8601String(),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: R.colors.whiteLight,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: R.colors.whiteColor2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,

              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: widget.sayantaliqDataModel.slug,
                      child: CachedNetworkImage(
                        imageUrl: widget.sayantaliqDataModel.product.images[0],
                        width: 120.w,
                        height: 158.h,
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) => Center(
                              child: const CircularProgressIndicator(),
                            ),
                        errorWidget:
                            (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Text(
                              widget.sayantaliqDataModel.product.nameAr,
                              style: R.textStyles.font16BlackW500Light,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          CustomBlocBuilderCountdown(
                            eventTime: eventTimeFromApi,
                            progressColor: R.colors.orangeColor,
                            backgroundColor: R.colors.orangeColor2,
                          ),
                          SizedBox(height: 12.h),
                          CoustomRowItem(
                            title: 'السعر بالأسواق',
                            price:
                                widget.sayantaliqDataModel.product.price
                                    .toString(),
                          ),
                          CoustomRowItem(
                            title: 'بداية المزاد',
                            price:
                                widget.sayantaliqDataModel.product.price
                                    .toString(),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 6.h),
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
                                  create: (_) => CounterCubit(eventTimeFromApi),
                                  child: BlocBuilder<
                                    CounterCubit,
                                    CounterState
                                  >(
                                    builder: (context, state) {
                                      if (state is CountdownRunning) {
                                        return Text(
                                          '0${state.hours}:0${state.minutes}:${state.seconds}',
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
                            AppRoutes.homeDetailsSayantaliqScreenRoute,
                            arguments: {
                              'eventTime': eventTimeFromApi,
                              'sayantaliqDataModel': widget.sayantaliqDataModel,
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
                        textDirection: TextDirection.rtl,
                        text: 'مشاركة',
                        onPressed: () {
                          SharePlus.instance.share(
                            ShareParams(
                              title: 'Mzaodin',
                              text: 'check out my website https://example.com',
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
        ],
      ),
    );
  }
}
