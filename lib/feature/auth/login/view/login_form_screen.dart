import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/helper/spacing.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/app_button.dart';
import 'package:mzaodina_app/feature/auth/widgets/auth_text_form.dart';

class LoginFormScreen extends StatelessWidget {
  const LoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: [
            AuthTextForm(
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            spacingV(15),
            AuthTextForm(hintText: 'كلمة المرور', isObscureText: true),
            spacingV(20),
            AppButton(
              text: 'تسجيل الدخول',
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.navBarRoute);
              },
            ),
            spacingV(10),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'هل نسيت كلمة المرور؟',
                  style: TextStyle(
                    color: R.colors.primaryColorLight,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
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
                    icon: Icon(
                      Icons.g_mobiledata,
                      size: 30,
                      color: R.colors.formIconColorLight,
                    ),
                    backgroundColor: R.colors.buttonColorLight,
                    text: 'تسجيل الدخول عبر جوجل',
                    textStyle: TextStyle(color: Color(0xFF777676)),
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
                    icon: Icon(
                      Icons.apple,
                      size: 30,
                      color: R.colors.formIconColorLight,
                    ),
                    backgroundColor: R.colors.buttonColorLight,
                    text: 'تسجيل الدخول عبر ابل',
                    textStyle: TextStyle(color: Color(0xFF777676)),
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
  }
}
