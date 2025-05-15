import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/feature/profile/view-model/cubit/profile_cubit.dart';
import 'package:mzaodina_app/feature/profile/view-model/cubit/profile_state.dart';

Widget logoutButton(context) {
  return CustomElevatedButton(
    textStyle: R.textStyles.font14Grey3W500Light.copyWith(
      color: R.colors.redColor2,
    ),
    textDirection: TextDirection.rtl,
    backgroundColor: R.colors.redColor3,
    text: 'تسجيل الخروج',
    onPressed: () {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BlocConsumer<ProfileCubit, ProfileCubitState>(
            listener: (context, state) {
              if (state is ProfileLogoutSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.authRouter,
                  (route) => false,
                );
              } else if (state is ProfileLogoutError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 130.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: R.colors.greyColor3,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    GestureDetector(
                      onTap:
                          state is ProfileLogoutLoading
                              ? null
                              : () {
                                context.read<ProfileCubit>().logout();
                              },
                      child: Text(
                        state is ProfileLogoutLoading
                            ? 'جاري تسجيل الخروج...'
                            : 'تسجيل الخروج',
                        style: R.textStyles.font14BlackW500Light.copyWith(
                          color: R.colors.redColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    CustomElevatedButton(
                      text: 'الغاء',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              );
            },
          );
        },
      );
    },
    icon: SvgPicture.asset(R.images.logoutImage),
  );
}
