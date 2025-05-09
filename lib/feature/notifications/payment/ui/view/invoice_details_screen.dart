import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view/widgets/countdown_timer_invoice.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  const InvoiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            CustomAppBarAccount(title: 'تفاصيل الفاتورة'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'تهانينا عزيزي / عزيزتي',
                      style: R.textStyles.font18blackW500Light,
                    ),
                    Text(
                      'محمد القحطانى',
                      style: R.textStyles.font18primaryW500Light,
                    ),
                    Image.asset(
                      R.images.congratulationsImage,
                      width: 200.w,
                      height: 185.h,
                    ),
                    SizedBox(height: 22),
                    Text(
                      textAlign: TextAlign.center,
                      'لقد تم اختيارك للفوز بالمنتج. لتحقيق شروط الفوز نود تذكيرك بأن لديك فاتورة متأخرة. نرجو منك تسديدها فى اقرب وقت ممكن. يرجى استخدام أدناه لاتمام عملية الدفع',
                      style: R.textStyles.font16BlackW400Light,
                    ),
                    SizedBox(height: 34.h),
                    // لاتمام عملية الدفع
                    CustomElevatedButton(
                      textDirection: TextDirection.rtl,
                      text: 'دفع الفاتورة',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.paymentDetailsScreenRoute,
                        );
                      },
                      icon: Image.asset(
                        R.images.taelimatIconPng,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        Text(
                          'ينتهى دفع الفاتورة خلال',
                          style: R.textStyles.font14BlackW500Light,
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              'دقيقة',
                              style: R.textStyles.font14Grey3W500Light,
                            ),
                            CountdownTimerInvoice(
                              initialDuration: const Duration(minutes: 30),
                            ), // بدء المؤقت من 30 دقيقة
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 90.h),
                    Text(
                      'تنبية : عملينا العزيز فى حال عدم السداد قبل انتهاء الوقت سيترتب عليه الغاء استحقاقك للفوز بالمنتج . ,',
                      style: R.textStyles.font14Grey400Light.copyWith(
                        color: R.colors.redColor,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Text(
                      'نشكرك على اهتمامك السريع بها الامر. اذ كان لديك استفساؤ او تحتاج الى مساعدة لاتتردد فى الاتصال بنا .',
                      style: R.textStyles.font14BlackW500Light,
                    ),
                    SizedBox(height: 22.h),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 136.w,
                        decoration: BoxDecoration(
                          color: R.colors.greenColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 16.w,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'تواصل واتس أب',
                              style: R.textStyles.font10whiteW500Light,
                            ),
                            Spacer(),
                            SvgPicture.asset(R.images.whatsIcon),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 27.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
