import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/home/home_details/data/model/home_details_model.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/notstart_auction_response.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_countdown_unit.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_indcator_item.dart';
import 'package:share_plus/share_plus.dart';

class CustomNotstartCardItem extends StatefulWidget {
  final UnifiedAuction notstartDataModel;

  const CustomNotstartCardItem({super.key, required this.notstartDataModel});

  @override
  State<CustomNotstartCardItem> createState() => _CustomNotstartCardItemState();
}

class _CustomNotstartCardItemState extends State<CustomNotstartCardItem> {
  late final int eventTimeFromApi;
  int d = 0, h = 0, m = 0, s = 0;
  @override
  void initState() {
    super.initState();
    eventTimeFromApi = widget.notstartDataModel.auctionDurationMinutes ?? 0;

    Duration duration = Duration(minutes: eventTimeFromApi);
    d = duration.inDays;
    h = duration.inHours % 24;
    m = duration.inMinutes % 60;
    s = duration.inSeconds % 60;
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
                    tag: widget.notstartDataModel.slug,
                    child: CachedNetworkImage(
                      imageUrl: widget.notstartDataModel.product!.images[0],
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
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Text(
                            widget.notstartDataModel.product?.nameAr ?? '',
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
                                progressColor: R.colors.primaryColorLight,
                                backgroundColor: R.colors.colorUnSelected,
                              ),
                            ),
                            Expanded(
                              child: CountdownUnitWidget(
                                value: m,
                                label: 'دقيقة',
                                maxValue: 60,
                                progressColor: R.colors.primaryColorLight,
                                backgroundColor: R.colors.colorUnSelected,
                              ),
                            ),
                            Expanded(
                              child: CountdownUnitWidget(
                                value: h,
                                maxValue: 24,
                                label: 'ساعة',
                                progressColor: R.colors.primaryColorLight,
                                backgroundColor: R.colors.colorUnSelected,
                              ),
                            ),
                            Expanded(
                              child: CountdownUnitWidget(
                                value: d,
                                label: 'يوم',
                                maxValue: 365,
                                progressColor: R.colors.primaryColorLight,
                                backgroundColor: R.colors.colorUnSelected,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        CoustomRowItem(
                          title: 'السعر بالأسواق',
                          price:
                              widget.notstartDataModel.product?.price.toString() ?? '',
                        ),
                        CoustomRowItem(
                          title: 'بداية المزاد',
                          price: widget.notstartDataModel.openingAmount
                              .toStringAsFixed(2),
                        ),
                        CustomIndcatorItem(
                          title: 'انطلاق المزاد',
                          showIndicator: true,
                          value:
                              widget.notstartDataModel.auctionStartRate!
                                  .round(),
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
                          AppRoutes.homeDetailsNotstartScreenRoute,
                          arguments: widget.notstartDataModel,
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
                            text:
                                'mzaodin.sa/auction/${widget.notstartDataModel.slug}',
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
