import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/helper/spacing.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view/widgets/custom_terms_and_conditions_widget.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view/widgets/enter_the_phone_number.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view/widgets/select_country.dart';

class CustomColumnRegisterTextField extends StatelessWidget {
  const CustomColumnRegisterTextField({
    super.key,
    required this.usernameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController usernameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextForm(
          controller: usernameController,
          hintText: 'اسم المستخدم',
          prefixIcon: Padding(
            padding: EdgeInsets.all(12.r),
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
        EnterThePhoneNumber(phoneNumberController: phoneController),
        spacingV(15.h),
        CustomTextForm(
          controller: emailController,
          hintText: 'البريد الالكتروني',
          prefixIcon: Padding(
            padding: EdgeInsets.all(12.r),
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
          controller: passwordController,
          hintText: 'كلمة المرور',
          isObscureText: true,
          prefixIcon: Padding(
            padding: EdgeInsets.all(12.r),
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
          controller: confirmPasswordController,
          hintText: 'تأكيد كلمة المرور',
          isObscureText: true,
          prefixIcon: Padding(
            padding: EdgeInsets.all(12.r),
            child: SvgPicture.asset(
              R.images.passwordIcon,
              width: 23.w,
              height: 23.h,
            ),
          ),
          keyboardType: TextInputType.visiblePassword,
        ),
        spacingV(5.h),
        CustomTermsAndConditionsWidget(),
      ],
    );
  }
}
