import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({super.key});

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
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.completeShippingInformationScreenRoute,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
