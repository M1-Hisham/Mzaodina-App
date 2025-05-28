import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzaodina_app/core/helper/notification_helper.dart';
import 'package:mzaodina_app/core/helper/spacing.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/feature/auth/apple/view-model/apple_cubit/apple_cubit.dart';
import 'package:mzaodina_app/feature/auth/apple/view-model/apple_cubit/apple_cubit_state.dart'
    as apple;
import 'package:mzaodina_app/feature/auth/google/view-model/google_cubit/google_cubit_state.dart'
    as google;
import 'package:mzaodina_app/feature/auth/login/ui/view-model/login_cubit/login_cubit_state.dart'
    as login;
import 'package:mzaodina_app/feature/auth/apple/view/sign_in_with_apple.dart';
import 'package:mzaodina_app/feature/auth/google/sign_in_with_google.dart';
import 'package:mzaodina_app/feature/auth/google/view-model/google_cubit/google_cubit.dart';
import 'package:mzaodina_app/feature/auth/google/view-model/google_cubit/google_cubit_state.dart';
import 'package:mzaodina_app/feature/auth/login/ui/view-model/login_cubit/login_cubit.dart';
import 'package:mzaodina_app/feature/auth/login/data/model/login_request_body.dart';
import 'package:mzaodina_app/feature/auth/ui/view-model/cubit/auth_cubit_cubit.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/save_token_cubit/save_token_cubit.dart';

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
                BlocConsumer<LoginCubit, login.LoginCubitState>(
                  listener: (context, state) async {
                    if (state is login.LoginSuccess) {
                      _handleFcmToken(context);
                    } else if (state is login.LoginError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      text:
                          state is login.LoginLoading
                              ? '...جاري الدخول'
                              : 'تسجيل الدخول',
                      onPressed:
                          state is login.LoginLoading
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
                    /// Google login button
                    BlocConsumer<GoogleCubit, GoogleCubitState>(
                      listener: (context, state) async {
                        if (state is google.LoginSuccess) {
                          _handleFcmToken(context);
                        } else if (state is google.LoginError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        }
                      },
                      builder: (context, state) {
                        return Expanded(
                          child: CustomElevatedButton(
                            icon: SvgPicture.asset(R.images.googleIcon),
                            backgroundColor: R.colors.buttonColorLight,
                            text:
                                state is google.LoginLoading
                                    ? '...جاري تسجيل الدخول'
                                    : 'تسجيل الدخول عبر جوجل',
                            textStyle: R.textStyles.font12Grey3W500Light,
                            borderRadius: 14.r,
                            onPressed:
                                state is google.LoginLoading
                                    ? () {}
                                    : () {
                                      loginWithGoogle(context);
                                    },
                          ),
                        );
                      },
                    ),

                    /// Apple login button
                    if (Platform.isIOS) ...[
                      spacingH(10.w),
                      BlocConsumer<AppleCubit, apple.AppleCubitState>(
                        listener: (context, state) async {
                          if (state is apple.LoginSuccess) {
                            _handleFcmToken(context);
                          } else if (state is apple.LoginError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        builder: (context, state) {
                          return Expanded(
                            child: CustomElevatedButton(
                              icon: SvgPicture.asset(R.images.appleIcon),
                              backgroundColor: R.colors.buttonColorLight,
                              text:
                                  state is apple.LoginLoading
                                      ? '...جاري تسجيل الدخول'
                                      : 'تسجيل الدخول عبر ابل',
                              textStyle: R.textStyles.font12Grey3W500Light,
                              borderRadius: 14.r,
                              onPressed:
                                  state is apple.LoginLoading
                                      ? () {}
                                      : () {
                                        signInWithApple(context);
                                      },
                            ),
                          );
                        },
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
Future<void> _handleFcmToken(BuildContext context) async {
  final fcmToken = await NotificationHelper.initializeAndGetFcmToken();

  if (!context.mounted) return;

  Navigator.pushReplacementNamed(context, AppRoutes.navBarRoute);

  if (fcmToken != null) {
    // بترسل التوكن في الخلفية بعد التنقل
    Future.microtask(() {
      if (context.mounted) {
        context.read<SaveTokenCubit>().sendFcmToken(fcmToken);
      }
    });
  }
}

// Future<void> _handleFcmToken(BuildContext context) async {
//   final fcmToken = await NotificationHelper.initializeAndGetFcmToken();

//   if (!context.mounted) return; // ✅ تأكيد الأمان بعد await

//   if (fcmToken != null) {
//     context.read<SaveTokenCubit>().sendFcmToken(fcmToken);
//   }
//   Navigator.pushReplacementNamed(context, AppRoutes.navBarRoute);
// }
