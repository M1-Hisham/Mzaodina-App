import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/country_cubit/country_cubit.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_account_list_tile.dart';

class CustomUserDataDetailsSection extends StatelessWidget {
  const CustomUserDataDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: R.colors.blackColor3,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: R.colors.blackColor3),
      ),
      child: Column(
        children: [
          InkWell(
            onTap:
                () => Navigator.pushNamed(
                  context,
                  AppRoutes.accountDetailsScreenRoute,
                ),
            child: CustomAccountListTile(
              title: 'معلومات الحساب',
              leading: SvgPicture.asset(
                R.images.accountIcon,
                width: 17.5.w,
                height: 17.5.w,
              ),
            ),
          ),
          Divider(
            color: R.colors.colorUnSelected,
            height: 1.h,
            endIndent: 14.w,
            indent: 14.w,
          ),
          InkWell(
            onTap:
                () => Navigator.pushNamed(
                  context,
                  AppRoutes.changePasswordScreenRoute,
                ),
            child: CustomAccountListTile(
              title: 'تغير كلمة المرور',
              leading: SvgPicture.asset(
                R.images.passwordAccountIcon,
                width: 17.5.w,
                height: 17.5.w,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.settingScreenRoute);
            },
            child: CustomAccountListTile(
              title: 'الاعدادات',
              leading: SvgPicture.asset(
                R.images.settingIcon,
                width: 17.5.w,
                height: 17.5.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
