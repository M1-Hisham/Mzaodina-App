import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBarAccount(title: 'تغير كلمة المرور'),
            Text(
              'كلمة المرور القديمة',
              style: R.textStyles.font14Grey3W500Light,
            ),
            const SizedBox(height: 8),
            CustomTextForm(
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
              hintText: 'تاكيد كلمة المرور الجديدة',
              fillColor: R.colors.whiteLight,
              hintStyle: R.textStyles.font12Grey3W500Light,
            ),
            const SizedBox(height: 24),
            CustomElevatedButton(
              text: 'تغير كلمة المرور',
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder:
                      (BuildContext context) => Dialog(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18.0),
                          decoration: BoxDecoration(
                            color: R.colors.whiteLight,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'تم تغير كلمة المرور بنجاح !',
                                style: R.textStyles.font18blackW500Light,
                              ),
                              SizedBox(height: 24),
                              CustomElevatedButton(
                                text: 'اغلاق',
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
