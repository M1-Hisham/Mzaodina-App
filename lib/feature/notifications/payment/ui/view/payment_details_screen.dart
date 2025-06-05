import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/notifications/payment/data/model/last_invoice_model.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view/web_view_payment_details.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view_model/payment_invoice_cubit/payment_invoice_cubit.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';

class PaymentDetailsScreen extends StatelessWidget {
  final LastInvoiceData lastInvoiceData;
  const PaymentDetailsScreen({super.key, required this.lastInvoiceData});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentInvoiceCubit, PaymentInvoiceState>(
      listener: (context, state) {
        if (state is PaymentInvoiceError) {
                Navigator.pop(context);
          log('Error: ${state.message}');
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('${state.message}==')));
        } else if (state is PaymentInvoiceSuccess) {
                Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) =>
                      WebViewPaymentDetails(url: state.paymentInvoiceModel.url),
            ),
          );
        }
      },
      child: Scaffold(
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
                  price: '${lastInvoiceData.invoicePrice}  ',
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
                    price: '${lastInvoiceData.invoicePrice}  ',
                    textColor: R.colors.primaryColorLight,
                  ),
                ),
                SizedBox(height: 48.h),
                // تاكيد الدفع
                CustomElevatedButton(
                  text: 'تاكيد الدفع',
                  onPressed: () {
                    log("📦 invoiceNumber: ${lastInvoiceData.invoiceNumber}");
                    // ✅ عرض Dialog تحميل على طول
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder:
                          (_) => AlertDialog(
                            backgroundColor: R.colors.whiteLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            title: Container(
                              padding: EdgeInsets.all(18),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'لاتغلق النافذه',
                                    style: R.textStyles.font18blackW500Light,
                                  ),
                                  SizedBox(height: 16),
                                  Image.asset(
                                    R.images.loadingJsonIcon,

                                    width: 75,
                                    height: 75,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                    );
                    context.read<PaymentInvoiceCubit>().paymentInvoice(
                      lastInvoiceData.invoiceNumber,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
