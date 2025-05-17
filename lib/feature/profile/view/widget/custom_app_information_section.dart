import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_account_list_tile.dart';

class CustomAppInformationSection extends StatelessWidget {
  const CustomAppInformationSection({super.key});

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
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.aboutUsScreenRoute);
            },

            child: CustomAccountListTile(title: 'من نحن'),
          ),
          Divider(
            color: R.colors.colorUnSelected,
            height: 1.h,
            endIndent: 14.w,
            indent: 14.w,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.termsAndConditionsScreenRoute,
              );
            },

            child: CustomAccountListTile(title: 'الشروط والاحكام'),
          ),
          Divider(
            color: R.colors.colorUnSelected,
            height: 1.h,
            endIndent: 14.w,
            indent: 14.w,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.privacyPolicyScreenRoute);
            },

            child: CustomAccountListTile(title: 'سياسة الخصوصية'),
          ),
          Divider(
            color: R.colors.colorUnSelected,
            height: 1.h,
            endIndent: 14.w,
            indent: 14.w,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.shippingAndReturnPolicyScreenRoute,
              );
            },

            child: CustomAccountListTile(title: 'سياسة الشحن والاسترجاع'),
          ),
        ],
      ),
    );
  }
}
