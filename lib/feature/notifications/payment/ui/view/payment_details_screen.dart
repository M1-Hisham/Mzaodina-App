import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view/widgets/confirm_payment.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 30),
          child: Column(
            children: [
              CustomAppBarAccount(title: 'تفاصيل الدفع'),
              SizedBox(height: 30.h),
              Image.asset(R.images.appLogoPng, width: 100.w, height: 111.h),

              SizedBox(height: 48.h),
              CoustomRowItem(
                title: 'صافى الفاتورة',
                price: '110.00  ',
                priceColor: R.colors.black,
              ),
              CoustomRowItem(title: 'ضريبة القمية المضافة', price: '0.00  '),
              SizedBox(height: 18),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: R.colors.colorUnSelected,
                ),
                child: CoustomRowItem(
                  title: 'المجموع',
                  price: '110.00  ',
                  textColor: R.colors.primaryColorLight,
                ),
              ),
              SizedBox(height: 48.h),
              // تاكيد الدفع
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
                        child: ConfirmPayment(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
