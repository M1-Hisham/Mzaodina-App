import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/get_notification_cubit/get_notification_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/user_data_cubit/user_data_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/mark_notification_cubit/mark_notification_cubit.dart';

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
                          } else {
                            return Text(
                              '👋 كزائر',
                              style: R.textStyles.font18WhiteW500Light,
                            );
                          }
                        },
                      ),

                      const Spacer(),

                      /// الإشعارات تظهر فقط لو المستخدم مسجل دخول
                      BlocBuilder<UserDataCubit, UserDataState>(
                        builder: (context, userState) {
                          if (userState is UserDataSuccess) {
                            return BlocListener<
                              MarkNotificationCubit,
                              MarkNotificationState
                            >(
                              listener: (context, state) {
                                if (state is MarkNotificationSuccess) {
                                  context
                                      .read<GetNotificationCubit>()
                                      .fetchNotifications(1);
                                }
                              },
                              child: BlocBuilder<
                                GetNotificationCubit,
                                GetAllNotificationState
                              >(
                                builder: (context, notifState) {
                                  if (notifState is GetAllNotificationSuccess) {
                                    final hasUnreadNotifications =
                                        notifState.response.unreadCount > 0;
                                    return Stack(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              AppRoutes
                                                  .notificationsScreenRoute,
                                            );
                                          },
                                          child: SvgPicture.asset(
                                            R.images.iconNotiv,
                                            width: 26.w,
                                            height: 26.h,
                                          ),
                                        ),
                                        if (hasUnreadNotifications)
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: _FlashingDot(),
                                          ),
                                      ],
                                    );
                                  } else {
                                    return SvgPicture.asset(
                                      R.images.iconNotiv,
                                      width: 26.w,
                                      height: 26.h,
                                    );
                                  }
                                },
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
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

class _FlashingDot extends StatefulWidget {
  const _FlashingDot({super.key});

  @override
  State<_FlashingDot> createState() => _FlashingDotState();
}

class _FlashingDotState extends State<_FlashingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.6, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        width: 8.w,
        height: 8.h,
        decoration: BoxDecoration(
          color: R.colors.redColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
