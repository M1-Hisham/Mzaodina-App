import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/helper/spacing.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/app_button.dart';
import 'package:mzaodina_app/core/widgets/check-box/view-model/check_box_cubit.dart';
import 'package:mzaodina_app/feature/auth/register/view/widgets/enter_the_phone_number.dart';
import 'package:mzaodina_app/feature/auth/register/view/widgets/select_country.dart';
import 'package:mzaodina_app/feature/auth/widgets/auth_text_form.dart';

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
            AuthTextForm(
              hintText: 'اسم المستخدم',
              prefixIcon: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(R.images.userNameIcon),
              ),
              keyboardType: TextInputType.name,
            ),
            spacingV(15.h),
            SelectCountry(),
            spacingV(15.h),
            EnterThePhoneNumber(),
            spacingV(15.h),
            AuthTextForm(
              hintText: 'البريد الالكتروني',
              prefixIcon: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(R.images.emailIcon),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            spacingV(15.h),
            AuthTextForm(
              hintText: 'كلمة المرور',
              isObscureText: true,
              prefixIcon: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(R.images.passwordIcon),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            spacingV(15.h),
            AuthTextForm(
              hintText: 'تأكيد كلمة المرور',
              isObscureText: true,
              prefixIcon: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(R.images.passwordIcon),
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
                  onTap: () {},
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
