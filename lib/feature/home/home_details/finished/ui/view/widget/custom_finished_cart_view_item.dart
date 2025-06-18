import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/auction/cubit/auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/model/finished_auctions_response.dart';
import 'package:share_plus/share_plus.dart';

class FinishedCardList extends StatelessWidget {
  final List<FinishedAction> finishedItems;

  const FinishedCardList({super.key, required this.finishedItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.r),
      itemCount: finishedItems.length,
      itemBuilder: (context, index) {
        final item = finishedItems[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: CustomFinishedCardViewItem(finishedDataModel: item),
        );
      },
    );
  }
}

class CustomFinishedCardViewItem extends StatelessWidget {
  final FinishedAction finishedDataModel;

  const CustomFinishedCardViewItem({
    super.key,
    required this.finishedDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: R.colors.whiteLight,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: R.colors.whiteColor2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: finishedDataModel.slug,
                child: CachedNetworkImage(
                  imageUrl: finishedDataModel.product.images[0],
                  width: 120.w,
                  height: 158.h,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) =>
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
                        finishedDataModel.product.nameAr,
                        style: R.textStyles.font16BlackW500Light,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    CoustomRowItem(
                      title: 'السعر بالأسواق',
                      price: finishedDataModel.product.price.toString(),
                    ),
                    double.tryParse(finishedDataModel.winner.invoicePrice) != null
                        ? CoustomRowItem(
                                              title: ' ترسية المزاد',
                      price: finishedDataModel.winner.invoicePrice.toString(),
                          )
                        :                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ترسية المزاد',
                            style: R.textStyles.font12Grey3W500Light,
                          ),
                          Text(
                            finishedDataModel.winner.invoicePrice,
                            style: R.textStyles.font12primaryW600Light,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                  
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'المزاود',
                            style: R.textStyles.font12Grey3W500Light,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.end,
                              finishedDataModel.winner.user.username,
                              style: R.textStyles.font16primaryW600Light,
                              overflow: TextOverflow.ellipsis,
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
                      AppRoutes.homeDetailsFinishedScreenRoute,
                      arguments: finishedDataModel,
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
                        text: 'mzaodin.sa/auction/${finishedDataModel.slug}',
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
    );
  }
}
