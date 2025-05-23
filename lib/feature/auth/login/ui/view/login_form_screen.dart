import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzaodina_app/core/helper/spacing.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/feature/auth/apple/sign_in_with_apple.dart';
import 'package:mzaodina_app/feature/auth/login/ui/view-model/login_cubit/login_cubit.dart';
import 'package:mzaodina_app/feature/auth/login/ui/view-model/login_cubit/login_cubit_state.dart';
import 'package:mzaodina_app/feature/auth/login/data/model/login_request_body.dart';
import 'package:mzaodina_app/feature/auth/ui/view-model/cubit/auth_cubit_cubit.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';

class LoginFormScreen extends StatelessWidget {
  LoginFormScreen({super.key});

  final Map<String, dynamic> _formData = {};
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final formKey = context.read<AuthCubit>().formKey;
        return Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextForm(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال البريد الإلكتروني';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData['email'] = value;
                  },
                ),
                spacingV(15.h),
                CustomTextForm(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال كلمة المرور';
                    } else if (value.length < 6) {
                      return 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData['password'] = value;
                  },
                ),
                spacingV(20.h),
                BlocConsumer<LoginCubit, LoginCubitState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.navBarRoute,
                      );
                    } else if (state is LoginError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      text:
                          state is LoginLoading
                              ? '...جاري الدخول'
                              : 'تسجيل الدخول',
                      onPressed:
                          state is LoginLoading
                              ? () {}
                              : () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  log("Form Data: $_formData");
                                  final body = LoginRequestBody(
                                    email: _formData['email'],
                                    //'testMH@gmail.com',
                                    password: _formData['password'],
                                    //'StorngPassword12!',
                                  );
                                  context.read<LoginCubit>().login(body);
                                }
                              },
                    );
                  },
                ),
                spacingV(15.h),
                // Forgot password
                GestureDetector(
                  onTap: () {
                    context.read<AuthCubit>().showForgotPassword();
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'هل نسيت كلمة المرور؟',
                      style: R.textStyles.font12primaryW600Light,
                    ),
                  ),
                ),
                spacingV(10.h),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Text('او'),
                    ),
                    Expanded(child: Divider(color: R.colors.dividerColorLight)),
                  ],
                ),
                spacingV(10.h),
                // Google and Apple login buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        icon: SvgPicture.asset(R.images.googleIcon),
                        backgroundColor: R.colors.buttonColorLight,
                        text: 'تسجيل الدخول عبر جوجل',
                        textStyle: R.textStyles.font12Grey3W500Light,
                        borderRadius: 14.r,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.navBarRoute,
                          );
                        },
                      ),
                    ),
                    if (Platform.isIOS) ...[
                      spacingH(10.w),
                      Expanded(
                        child: CustomElevatedButton(
                          icon: SvgPicture.asset(R.images.appleIcon),
                          backgroundColor: R.colors.buttonColorLight,
                          text: 'تسجيل الدخول عبر ابل',
                          textStyle: R.textStyles.font12Grey3W500Light,
                          borderRadius: 14.r,
                          onPressed: () {
                            signInWithApple(context);
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
