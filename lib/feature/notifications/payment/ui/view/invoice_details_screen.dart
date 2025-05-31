import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/shimmer/invoice_shimmer.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view/widgets/countdown_timer_invoice.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view_model/Last_invoice_cubit/last_invoice_cubit.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  const InvoiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastInvoiceCubit, LastInvoiceState>(
      builder: (context, state) {
        if (state is LastInvoiceLoading) {
          return const Scaffold(body: Center(child: InvoiceShimmer()));
        }

        if (state is LastInvoiceError) {
          return Scaffold(
            backgroundColor: R.colors.whiteLight,

            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  CustomAppBarAccount(title: 'تفاصيل الفاتورة'),
                  Expanded(
                    child: Text(
                      'لا يوجد فاتورة الان ',
                      style: R.textStyles.font14primaryW500Light,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is LastInvoiceSuccess) {
          final invoice = state.lastInvoiceModel;

          if (invoice.data.status != "pending") {
            return Scaffold(
              backgroundColor: R.colors.whiteLight,
              body: const Center(
                child: Text(
                  "لا توجد فاتورة حالياً",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }

          // final expiresAt = DateTime.parse(invoice.data.expiresAt);
          // final now = DateTime.now();
          // final difference = expiresAt.difference(now);
          // final minutes = difference.inMinutes;

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
                            invoice.data.user.name,
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
                          CustomElevatedButton(
                            textDirection: TextDirection.rtl,
                            text: 'دفع الفاتورة',
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.paymentDetailsScreenRoute,
                                arguments: invoice.data,
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
                                    expiresAt: DateTime.parse(
                                      invoice.data.expiresAt,
                                    ),
                                  ),
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

        return const SizedBox(); // لحالة initial
      },
    );
  }
}
