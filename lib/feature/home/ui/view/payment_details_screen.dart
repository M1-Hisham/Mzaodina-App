import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/app_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 30),
        child: Column(
          children: [
            CustomAppBarAccount(title: 'تفاصيل الدفع'),
            SizedBox(height: 30.h),
            Image.asset(R.images.appLogoPng, width: 100.w, height: 111.h),

            SizedBox(height: 48.h),
            CoustomRowItem(title: 'صافى الفاتورة', price: '110.00  '),
            CoustomRowItem(title: 'ضريبة القمية المضافة', price: '0.00  '),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: R.colors.colorUnSelected,
              ),
              child: CoustomRowItem(title: 'المجموع', price: '110.00  '),
            ),
            SizedBox(height: 48.h),
            CustomElevatedButton(
              text: 'تاكيد الدفع',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: CustomBottomSheetItem(),
                    );
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

class CustomBottomSheetItem extends StatelessWidget {
  const CustomBottomSheetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(R.images.tureImage, width: 100.w, height: 100.h),
        SizedBox(height: 16.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  text: 'تم دفع الفاتورة ',
                  style: R.textStyles.font22blackW500Light,
                  children: [
                    TextSpan(
                      text: 'بنجاح',
                      style: R.textStyles.font22blackW500Light.copyWith(
                        color: R.colors.primaryColorLight,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35.h),
              CustomElevatedButton(
                text: 'استكمل معلومات الشحن',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
