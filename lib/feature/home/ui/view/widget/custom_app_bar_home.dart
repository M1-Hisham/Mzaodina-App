import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/feature/profile/view_model/user_data_cubit/user_data_cubit.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: R.colors.primaryColorLight,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned(top: 0, child: SvgPicture.asset(R.images.appLogoFram39)),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.only(
                right: 28.w,
                left: 32.w,
                top: 30.h,
                bottom: 30.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'أهلاً وسهلاً,',
                    style: R.textStyles.font18GreyW500Light,
                  ),

                  SizedBox(height: 7.h),
                  Row(
                    children: [
                      BlocBuilder<UserDataCubit, UserDataState>(
                        builder: (context, state) {
                          if (state is UserDataLoading) {
                            return Text(
                              '👋 ...',
                              style: R.textStyles.font18WhiteW500Light,
                            );
                          } else if (state is UserDataNotLoggedIn) {
                            return Text(
                              '👋 كزائر',
                              style: R.textStyles.font18WhiteW500Light,
                            );
                          } else if (state is UserDataSuccess) {
                            return Text(
                              '👋 ${state.userModel.data?.username ?? ''}',
                              style: R.textStyles.font18WhiteW500Light,
                            );
                          } else if (state is UserDataError) {
                            return Text(
                              '👋 كزائر',
                              style: R.textStyles.font18WhiteW500Light,
                            );
                          } else {
                            return Text(
                              '👋 كزائر',
                              style: R.textStyles.font18WhiteW500Light,
                            );
                          }
                        },
                      ),
                      Spacer(),
                      Stack(
                        children: [
                          InkWell(
                            onTap:
                                () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.notificationsScreenRoute,
                                  // AppRoutes.notificationsScreenRoute,
                                ),
                            child: SvgPicture.asset(
                              R.images.iconNotiv,
                              width: 26.w,
                              height: 26.h,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 8.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                color: R.colors.redColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
