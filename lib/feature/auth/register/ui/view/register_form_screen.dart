import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/helper/spacing.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/check-box/view-model/check_box_cubit.dart';
import 'package:mzaodina_app/feature/auth/register/data/model/register_model.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view/widgets/custom_column_register_text_field.dart';

import 'package:mzaodina_app/feature/auth/register/ui/view_model/country_cubit/country_cubit.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/register_cubit/register_cubit.dart';

class RegisterFormScreen extends StatefulWidget {
  const RegisterFormScreen({super.key});

  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreenState();
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Form(
        key: _formKey,
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder:
                    (context) =>
                        const Center(child: CircularProgressIndicator()),
              );
            } else if (state is RegisterSuccess) {
              Navigator.pushReplacementNamed(context, AppRoutes.navBarRoute);
            } else if (state is RegisterError) {
              Navigator.pop(context); // Close Dialog
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: Column(
            children: [
              CustomColumnRegisterTextField(
                usernameController: usernameController,
                phoneController: phoneController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              ),

              spacingV(10.h),
              CustomElevatedButton(
                text: 'انشاء حساب',
                onPressed: () {
                  final flag = context.read<CountryCubit>().flagSelected;
                  final termsAccepted =
                      context.read<CheckboxCubit>().state.isChecked;
                  log('termsAccepted = $termsAccepted');
                  final registerModel = RegisterModel(
                    username: usernameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    terms: termsAccepted,
                    country: flag,
                    phone: phoneController.text,
                    phoneCode: flag,
                  );
                  log(registerModel.toString());
                  if (_formKey.currentState!.validate()) {
                    if (!termsAccepted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("يجب الموافقة على الشروط أولاً."),
                        ),
                      );
                      return;
                    }
                    context.read<RegisterCubit>().register(registerModel);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
