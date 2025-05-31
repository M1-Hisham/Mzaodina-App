
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/check-box/view/custom_check_box.dart';
import 'package:mzaodina_app/feature/profile/terms&conditions/view/terms_and_conditions_screen.dart';

class CustomTermsAndConditionsWidget extends StatelessWidget {
  const CustomTermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(),

        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TermsAndConditionsScreen(),
              ),
            );
          },
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
    );
  }
}
