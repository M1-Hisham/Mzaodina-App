import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/helper/spacing.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/feature/auth/ui/view-model/cubit/auth_cubit_cubit.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(20.r),
          child: Form(
            child: Column(
              children: [
                CustomTextForm(
                  hintText: 'البريد الالكتروني',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10.r),
                    child: SvgPicture.asset(R.images.emailIcon),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                spacingV(26.h),
                CustomElevatedButton(text: 'تحقق من الكود', onPressed: () {}),
                spacingV(15.h),
                GestureDetector(
                  onTap: () => context.read<AuthCubit>().showLogin(),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text.rich(
                      TextSpan(
                        text: 'تذكر كلمة المرور ',
                        style: R.textStyles.font12Grey3W500Light,
                        children: [
                          TextSpan(
                            text: 'تسجيل الدخول ؟',
                            style: R.textStyles.font12primaryW600Light,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
