import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/helper/spacing.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/app_button.dart';
import 'package:mzaodina_app/feature/auth/widgets/auth_text_form.dart';

class RegisterFormScreen extends StatelessWidget {
  const RegisterFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            AuthTextForm(
              hintText: 'اسم المستخدم',
              keyboardType: TextInputType.name,
            ),
            spacingV(15),
            AuthTextForm(
              hintText: 'رقم الهاتف',
              keyboardType: TextInputType.phone,
            ),
            spacingV(15),
            AuthTextForm(
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            spacingV(15),
            AuthTextForm(hintText: 'كلمة المرور', isObscureText: true),
            spacingV(15),
            AuthTextForm(hintText: 'تأكيد كلمة المرور', isObscureText: true),
            spacingV(20),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Expanded(child: Text('الموافقة على الشروط والاحكام')),
              ],
            ),
            spacingV(10),
            AppButton(
              text: 'انشاء حساب',
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.navBarRoute);
              },
            ),
            spacingV(10),
          ],
        ),
      ),
    );
  }
}
