import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/helper/spacing.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
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
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(R.images.userNameIcon),
              ),
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
            spacingV(15),
            AuthTextForm(
              hintText: 'تأكيد كلمة المرور',
              isObscureText: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(R.images.passwordIcon),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            spacingV(20),

            Row(
              children: [
                Checkbox(
                  checkColor: R.colors.whiteLight,
                  activeColor: R.colors.primaryColorLight,
                  side: BorderSide(color: R.colors.borderColorsLight),
                  value: true,
                  onChanged: (value) {},
                ),
                GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text.rich(
                      TextSpan(
                        text: 'الموافقة علي ',
                        style: R.textStyles.font12Grey3W500Light,
                        children: [
                          TextSpan(
                            text: 'الشروط والاحكام',
                            style: R.textStyles.font12primaryW600Light,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
