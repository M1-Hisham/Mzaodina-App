import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/app_button.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';
import 'package:mzaodina_app/feature/auth/register/view/widgets/enter_the_phone_number.dart';
import 'package:mzaodina_app/feature/auth/register/view/widgets/select_country.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBarAccount(title: 'معلومات الحساب'),

                  Text(
                    'اسم المستخدم',
                    style: R.textStyles.font14Grey3W500Light,
                  ),
                  const SizedBox(height: 8),
                  CustomTextForm(
                    hintText: 'اسم المستخدم',
                    fillColor: R.colors.whiteLight,
                    hintStyle: R.textStyles.font12Grey3W500Light,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'الاسم الحقيقي',
                    style: R.textStyles.font14Grey3W500Light,
                  ),
                  const SizedBox(height: 8),
                  CustomTextForm(
                    hintText: 'الاسم الحقيقي',
                    fillColor: Colors.white,

                    hintStyle: R.textStyles.font12Grey3W500Light,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'البريد الالكترونى',
                    style: R.textStyles.font14Grey3W500Light,
                  ),
                  const SizedBox(height: 8),
                  CustomTextForm(
                    hintText: 'البريد الالكترونى',
                    fillColor: Colors.white,

                    hintStyle: R.textStyles.font12Grey3W500Light,
                  ),
                  const SizedBox(height: 14),
                  Text('اختر الدولة', style: R.textStyles.font14Grey3W500Light),
                  const SizedBox(height: 8),
                  SelectCountry(color: R.colors.whiteLight),
                  const SizedBox(height: 14),
                  Text('رقم الهاتف', style: R.textStyles.font14Grey3W500Light),
                  const SizedBox(height: 8),
                  EnterThePhoneNumber(
                    fillColor: R.colors.whiteLight,
                    hintStyle: R.textStyles.font12Grey3W500Light,
                  ),
                  const SizedBox(height: 14),
                  Text('المدينة', style: R.textStyles.font14Grey3W500Light),
                  const SizedBox(height: 8),
                  CustomTextForm(
                    hintText: 'المدينة',
                    fillColor: Colors.white,

                    hintStyle: R.textStyles.font12Grey3W500Light,
                  ),
                  const SizedBox(height: 14),
                  Text('الحي', style: R.textStyles.font14Grey3W500Light),
                  const SizedBox(height: 8),
                  CustomTextForm(
                    hintText: 'الحي',
                    fillColor: Colors.white,

                    hintStyle: R.textStyles.font12Grey3W500Light,
                  ),
                  const SizedBox(height: 14),
                  Text('الشارع', style: R.textStyles.font14Grey3W500Light),
                  const SizedBox(height: 8),
                  CustomTextForm(
                    hintText: 'الشارع',
                    fillColor: Colors.white,

                    hintStyle: R.textStyles.font12Grey3W500Light,
                  ),
                  SizedBox(height: 150.h),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(color: R.colors.whiteLight),
              child: CustomElevatedButton(text: 'الاستمرار', onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}

