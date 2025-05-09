import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/helper/spacing.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/check-box/view-model/check_box_cubit.dart';
import 'package:mzaodina_app/feature/auth/register/view/widgets/enter_the_phone_number.dart';
import 'package:mzaodina_app/feature/auth/register/view/widgets/select_country.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';
import 'package:mzaodina_app/feature/profile/terms&conditions/view/terms_and_conditions_screen.dart';

import '../../../../core/widgets/check-box/view/custom_check_box.dart';

class RegisterFormScreen extends StatelessWidget {
  const RegisterFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Form(
        child: Column(
          children: [
            CustomTextForm(
              hintText: 'اسم المستخدم',
              prefixIcon: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(
                  R.images.userNameIcon,
                  width: 23.w,
                  height: 23.h,
                ),
              ),
              keyboardType: TextInputType.name,
            ),
            spacingV(15.h),
            SelectCountry(),
            spacingV(15.h),
            EnterThePhoneNumber(),
            spacingV(15.h),
            CustomTextForm(
              hintText: 'البريد الالكتروني',
              prefixIcon: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(
                  R.images.emailIcon,
                  width: 23.w,
                  height: 23.h,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            spacingV(15.h),
            CustomTextForm(
              hintText: 'كلمة المرور',
              isObscureText: true,
              prefixIcon: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(
                  R.images.passwordIcon,
                  width: 23.w,
                  height: 23.h,
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            spacingV(15.h),
            CustomTextForm(
              hintText: 'تأكيد كلمة المرور',
              isObscureText: true,
              prefixIcon: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(
                  R.images.passwordIcon,
                  width: 23.w,
                  height: 23.h,
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            spacingV(20.h),

            Row(
              children: [
                BlocProvider(
                  create: (context) => CheckboxCubit(initialValue: false),
                  child: const CustomCheckbox(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsAndConditionsScreen(),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text.rich(
                      TextSpan(
                        text: 'الموافقة علي ',
                        style: R.textStyles.font12Grey3W500Light,
                        children: [
                          TextSpan(
                            text: 'الشروط والاحكام',
                            style: R.textStyles.font12primaryW600Light,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            spacingV(10.h),
            CustomElevatedButton(
              text: 'انشاء حساب',
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.navBarRoute);
              },
            ),
            spacingV(10.h),
          ],
        ),
      ),
    );
  }
}
