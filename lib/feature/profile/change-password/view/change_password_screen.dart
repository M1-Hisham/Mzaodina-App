import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_dialog_widget.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';
import 'package:mzaodina_app/feature/profile/change-password/data/model/change_password_model.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';
import 'package:mzaodina_app/feature/profile/change-password/view_model/change_password_cubit/change_password_cubit.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomAppBarAccount(title: 'تغير كلمة المرور'),
            SingleChildScrollView(
              child: BlocListener<ChangePasswordCubit, ChangePasswordState>(
                listener: (context, state) {
                  if (state is ChangePasswordLoading) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder:
                          (context) =>
                              const Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is ChangePasswordSuccess) {
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
                  } else if (state is ChangePasswordFailure) {
                    Navigator.pop(context); // Close Dialog
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'كلمة المرور القديمة',
                      style: R.textStyles.font14Grey3W500Light,
                    ),
                    const SizedBox(height: 8),
                    CustomTextForm(
                      controller: oldPasswordController,
                      hintText: 'كلمة المرور القديمة',
                      fillColor: R.colors.whiteLight,
                      hintStyle: R.textStyles.font12Grey3W500Light,
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'كلمة المرور الجديدة',
                      style: R.textStyles.font14Grey3W500Light,
                    ),
                    const SizedBox(height: 8),
                    CustomTextForm(
                      controller: newPasswordController,
                      hintText: 'كلمة المرور الجديدة',
                      fillColor: R.colors.whiteLight,
                      hintStyle: R.textStyles.font12Grey3W500Light,
                    ),
                    const SizedBox(height: 14),
                    const SizedBox(height: 14),
                    Text(
                      'تاكيد كلمة المرور الجديدة',
                      style: R.textStyles.font14Grey3W500Light,
                    ),
                    const SizedBox(height: 8),
                    CustomTextForm(
                      controller: confirmPasswordController,
                      hintText: 'تاكيد كلمة المرور الجديدة',
                      fillColor: R.colors.whiteLight,
                      hintStyle: R.textStyles.font12Grey3W500Light,
                    ),
                    const SizedBox(height: 24),
                    CustomElevatedButton(
                      text: 'تغير كلمة المرور',
                      onPressed: () {
                        final changePasswordModel = ChangePasswordModel(
                          currentPassword: oldPasswordController.text,
                          newPassword: newPasswordController.text,
                          newPasswordConfirmation:
                              confirmPasswordController.text,
                        );

                        if (newPasswordController.text ==
                            confirmPasswordController.text) {
                          context.read<ChangePasswordCubit>().changePassword(
                            changePasswordModel,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('كلمة المرور الجديدة غير متطابقة.'),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
