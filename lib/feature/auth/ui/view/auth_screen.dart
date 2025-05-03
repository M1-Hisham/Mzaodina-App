import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/helper/spacing.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/ui/forgot_password_screen.dart';
import 'package:mzaodina_app/feature/auth/login/view/login_form_screen.dart';
import 'package:mzaodina_app/feature/auth/register/view/register_form_screen.dart';
import 'package:mzaodina_app/feature/auth/ui/view-model/cubit/auth_cubit_cubit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: R.colors.primaryColorLight,
        resizeToAvoidBottomInset: true,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                  top: 250,
                  left: 0,
                  child: SvgPicture.asset(R.images.appLogoFram40),
                ),
                SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Spacer(),
                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  _buildHeader(context),
                                  spacingV(20.h),
                                ],
                              );
                            },
                          ),

                          Container(
                            alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(
                              color: R.colors.whiteLight,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(30.r),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, state) {
                                  return Column(
                                    children: [
                                      spacingV(20.h),
                                      state == AuthState.forgotPassword
                                          ? const SizedBox.shrink()
                                          : _toggleButtons(
                                            context.read<AuthCubit>(),
                                            context.watch<AuthCubit>().state,
                                          ),
                                      spacingV(20),
                                      if (state == AuthState.login)
                                        LoginFormScreen(),
                                      if (state == AuthState.register)
                                        RegisterFormScreen(),
                                      if (state == AuthState.forgotPassword)
                                        ForgotPasswordScreen(),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: SvgPicture.asset(R.images.appLogoFram39),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state == AuthState.login) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "   \"اهلا بكم\nفي مزاودين",
                style: R.textStyles.font34WhiteW500Light,
              ),
            ),
          );
        } else if (state == AuthState.forgotPassword) {
          return Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "نسيت كلمة المرور",
                    style: R.textStyles.font34WhiteW500Light,
                  ),
                ),
                spacingV(5.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "ادخل البريد الالكتروني",
                    style: R.textStyles.font18GreyW500Light,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _toggleButtons(cubit, state) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Color(0xFFE9EEFC),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: cubit.showLogin,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color:
                      state == AuthState.login
                          ? R.colors.black
                          : R.colors.transparent,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  'تسجيل الدخول',
                  style: R.textStyles.font14whiteW500Light.copyWith(
                    color:
                        state == AuthState.register
                            ? R.colors.black
                            : R.colors.whiteLight,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: cubit.showRegister,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color:
                      state == AuthState.register
                          ? R.colors.black
                          : R.colors.transparent,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  'انشاء حساب',
                  style: R.textStyles.font14whiteW500Light.copyWith(
                    color:
                        state == AuthState.register
                            ? R.colors.whiteLight
                            : R.colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
