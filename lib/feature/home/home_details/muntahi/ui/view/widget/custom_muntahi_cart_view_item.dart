import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/home/home_details/muntahi/data/model/muntahi_auctions_response.dart';
import 'package:share_plus/share_plus.dart';

class CustomMuntahiCardViewItem extends StatefulWidget {
  final MuntahiAction muntahiDataModel;
  const CustomMuntahiCardViewItem({super.key, required this.muntahiDataModel});

  @override
  State<CustomMuntahiCardViewItem> createState() =>
      _CustomQadimCardViewItemState();
}

class _CustomQadimCardViewItemState extends State<CustomMuntahiCardViewItem> {
  @override
  Widget build(BuildContext context) {
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
                      tag: widget.muntahiDataModel.slug,
                      child: CachedNetworkImage(
                        imageUrl: widget.muntahiDataModel.product.images[0],
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
                              widget.muntahiDataModel.product.nameAr,
                              style: R.textStyles.font16BlackW500Light,
                            ),
                          ),

                          SizedBox(height: 12.h),
                          CoustomRowItem(
                            title: 'السعر بالأسواق',
                            price:
                                widget.muntahiDataModel.product.price
                                    .toString(),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(vertical: 6.h),
                            color: R.colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'ترسية المزاد',
                                  style: R.textStyles.font12Grey3W500Light,
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
                            padding: EdgeInsets.symmetric(vertical: 6.h),
                            color: R.colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'المزاود',
                                  style: R.textStyles.font12Grey3W500Light,
                                ),
                                Spacer(),
                                Text(
                                  'لايوجد',
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
                            AppRoutes.homeDetailsMuntahiScreenRoute,
                            arguments: widget.muntahiDataModel,
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
