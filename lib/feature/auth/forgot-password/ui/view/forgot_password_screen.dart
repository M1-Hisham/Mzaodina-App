import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/helper/spacing.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_dialog_widget.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/ui/view_model/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:mzaodina_app/feature/auth/ui/view-model/cubit/auth_cubit_cubit.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder:
                    (context) =>
                        const Center(child: CircularProgressIndicator()),
              );
            } else if (state is ForgotPasswordSuccess) {
              Navigator.pop(context);

              showDialog(
                context: context,
                builder:
                    (BuildContext context) => CustomDialogWidget(
                      buttonText: 'اغلاق',
                      message: state.message,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
              );
            } else if (state is ForgotPasswordFailure) {
              Navigator.pop(context); 
              showDialog(
                context: context,
                builder:
                    (BuildContext context) => CustomDialogWidget(
                      buttonText: 'اغلاق',
                      message: state.errorMessage,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
              );
            }
          },
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Form(
              key: formKey,
              child: Column(
                children: [
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
                  spacingV(26.h),
                  CustomElevatedButton(
                    text: 'تحقق من الكود',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<ForgotPasswordCubit>().forgotPassword(
                          emailController.text,
                        );
                      }
                    },
                  ),
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
          ),
        );
      },
    );
  }
}
