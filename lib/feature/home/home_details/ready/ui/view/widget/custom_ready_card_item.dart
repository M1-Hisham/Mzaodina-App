import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/auction/cubit/auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/ready_auction_response.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_countdown_unit.dart';
import 'package:mzaodina_app/feature/home/ui/view_model/counter_cubit/counter_cubit.dart';
import 'package:mzaodina_app/feature/web-socket/cubit/web_socket_cubit.dart';
import 'package:mzaodina_app/feature/web-socket/cubit/web_socket_state.dart';
import 'package:share_plus/share_plus.dart';

class CustomSayantilqCardItem extends StatefulWidget {
  final ReadyAuction sayantaliqDataModel;

  const CustomSayantilqCardItem({super.key, required this.sayantaliqDataModel});

  @override
  State<CustomSayantilqCardItem> createState() =>
      _CustomSayantilqCardItemState();
}

class _CustomSayantilqCardItemState extends State<CustomSayantilqCardItem> {
  late final DateTime eventTimeFromApi;
  late final Duration initialDuration;
  int d = 0, h = 0, m = 0, s = 0;

  @override
  void initState() {
    super.initState();
    eventTimeFromApi = DateTime.parse(
      widget.sayantaliqDataModel.startAt ?? DateTime.now().toIso8601String(),
    );
    initialDuration = Duration(
      minutes: widget.sayantaliqDataModel.auctionDurationMinutes ?? 0,
    );
    _updateDuration();
  }

  void _updateDuration() {
    d = initialDuration.inDays;
    h = initialDuration.inHours % 24;
    m = initialDuration.inMinutes % 60;
    s = initialDuration.inSeconds % 60;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                            widget.sayantaliqDataModel.product.nameAr,
                            style: R.textStyles.font16BlackW500Light,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Row(
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
                                label: 'ساعة',
                                maxValue: 24,
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
                        SizedBox(height: 12.h),
                        CoustomRowItem(
                          title: 'السعر بالأسواق',
                          price:
                              widget.sayantaliqDataModel.product.price
                                  .toString(),
                        ),
                        CoustomRowItem(
                          title: 'بداية المزاد',
                          price: widget.sayantaliqDataModel.openingAmount
                              .toStringAsFixed(2),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: Row(
                            children: [
                              Text(
                                'انطلاق المزاد',
                                style: R.textStyles.font12Grey3W500Light,
                              ),
                              const Spacer(),
                              BlocBuilder<WebSocketCubit, WebSocketState>(
                                builder: (context, state) {
                                  return BlocProvider(
                                    create:
                                        (_) => CounterCubit(
                                          eventTime: eventTimeFromApi,
                                          getNow:
                                              () =>
                                                  context
                                                      .read<WebSocketCubit>()
                                                      .getCurrentServerTime(),
                                        ),
                                    child: BlocBuilder<
                                      CounterCubit,
                                      CounterState
                                    >(
                                      builder: (context, state) {
                                        if (state is CountdownRunning) {
                                          return Text(
                                            '${state.hours.toString().padLeft(2, '0')}:${state.minutes.toString().padLeft(2, '0')}:${state.seconds.toString().padLeft(2, '0')}',
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
                                  );
                                },
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
                        AuctionCubit.get(context).disconnectWebSocket();

                        AuctionCubit.get(context).auctionState(
                          id: widget.sayantaliqDataModel.id.toString(),
                          state: "ongoing",
                        );
                        Navigator.pushNamed(
                          context,
                          AppRoutes.homeDetailsReadyScreenRoute,
                          arguments: {
                            'eventTime': eventTimeFromApi,
                            'sayantaliqDataModel': widget.sayantaliqDataModel,
                            's': s,
                            'm': m,
                            'h': h,
                            'd': d,
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
                                'mzaodin.sa/auction/${widget.sayantaliqDataModel.slug}',
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
    );
  }
}
