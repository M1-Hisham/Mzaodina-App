import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';

class CustomBottonNotLogin extends StatelessWidget {
  const CustomBottonNotLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: R.colors.blackColor3,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(14.r),

      child: Column(
        children: [
          Text(
            'انت غير مسجل في مزاودين',
            style: R.textStyles.font14Grey3W500Light,
          ),
          SizedBox(height: 17.h),
          CustomElevatedButton(
            text: 'تسجيل الدخول',
            onPressed: () {
              Navigator.pushNamed(
                // ignore: use_build_context_synchronously
                context,
                AppRoutes.authRouter,
              );
            },
          ),
        ],
      ),
    );
  }
}
