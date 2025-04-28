import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzaodina_app/core/helper/spacing.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/app_button.dart';
import 'package:mzaodina_app/feature/auth/ui/view-model/cubit/auth_cubit_cubit.dart';
import 'package:mzaodina_app/feature/auth/widgets/auth_text_form.dart';

class LoginFormScreen extends StatelessWidget {
  const LoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                AuthTextForm(
                  hintText: 'البريد الالكتروني',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(R.images.emailIcon),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                spacingV(15),
                AuthTextForm(
                  hintText: 'كلمة المرور',
                  isObscureText: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(R.images.passwordIcon),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                spacingV(20),
                AppButton(
                  text: 'تسجيل الدخول',
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.navBarRoute,
                    );
                  },
                ),
                spacingV(10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      context.read<AuthCubit>().showForgotPassword();
                    },
                    child: Text(
                      'هل نسيت كلمة المرور؟',
                      style: R.textStyles.font12primaryW600Light,
                    ),
                  ),
                ),
                spacingV(10),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('او'),
                    ),
                    Expanded(child: Divider(color: R.colors.dividerColorLight)),
                  ],
                ),
                spacingV(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AppButton(
                        icon: SvgPicture.asset(R.images.googleIcon),
                        backgroundColor: R.colors.buttonColorLight,
                        text: 'تسجيل الدخول عبر جوجل',
                        textStyle: R.textStyles.font12Grey3W500Light,
                        borderRadius: 14,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.navBarRoute,
                          );
                        },
                      ),
                    ),
                    spacingH(10),
                    Expanded(
                      child: AppButton(
                        icon: SvgPicture.asset(R.images.appleIcon),
                        backgroundColor: R.colors.buttonColorLight,
                        text: 'تسجيل الدخول عبر ابل',
                        textStyle: R.textStyles.font12Grey3W500Light,
                        borderRadius: 14,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.navBarRoute,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                spacingV(20),
              ],
            ),
          ),
        );
      },
    );
  }
}
