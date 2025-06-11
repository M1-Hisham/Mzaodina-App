import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_erorr_widget.dart';
import 'package:mzaodina_app/core/widgets/shimmer/notifications_shimmer.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/repo/sayantaliq_show_aution_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view/home_details_sayantaliq_screen.dart';
import 'package:mzaodina_app/feature/notifications/data/model/get_all_notification_model.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/get_notification_cubit/get_notification_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/mark_notification_cubit/mark_notification_cubit.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final cubit = context.read<GetNotificationCubit>();
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;

      if (currentScroll >= (maxScroll - 200) &&
          !cubit.isLoadingMore &&
          cubit.currentPage < cubit.totalPages) {
        cubit.fetchNotifications(cubit.currentPage + 1, append: true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GetNotificationCubit>();

    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _customAppBar(title: 'الإشعارات', context: context),
            SizedBox(height: 12.h),
            InkWell(
              onTap: () {
                final getNotificationState = cubit.state;

                if (getNotificationState is GetAllNotificationSuccess) {
                  final allIds =
                      getNotificationState.response.notifications.data
                          .map((e) => e.id)
                          .toList();
                  context.read<MarkNotificationCubit>().markAllNotifications(
                    allIds,
                  );
                }
              },
              child: Text(
                'تحديد الكل كمقروء',
                style: R.textStyles.font14primaryW500Light,
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  cubit.fetchNotifications(1);
                },
                child:
                    BlocBuilder<GetNotificationCubit, GetAllNotificationState>(
                      builder: (context, state) {
                        if (state is GetAllNotificationLoading) {
                          return Center(child: NotificationsShimmer());
                        } else if (state is GetAllNotificationFailure) {
                          return CustomErorrWidget(
                            message: 'لا توجد اشعارات جديدة',
                            onRefresh: () => cubit.fetchNotifications(1),
                          );
                        } else if (state is GetAllNotificationSuccess) {
                          final notifications =
                              state.response.notifications.data;
                          if (notifications.isEmpty) {
                            return Center(
                              child: Text(
                                'لا توجد إشعارات جديدة',
                                style: R.textStyles.font14BlackW500Light,
                              ),
                            );
                          }

                          return ListView.separated(
                            controller: _scrollController,
                            itemCount: notifications.length + 1,
                            separatorBuilder: (_, __) => SizedBox(height: 12.h),
                            itemBuilder: (context, index) {
                              if (index < notifications.length) {
                                final notification = notifications[index];
                                return CustomNotificationItem(
                                  notification: notification,
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Center(
                                    child:
                                        cubit.currentPage < cubit.totalPages
                                            ? CircularProgressIndicator()
                                            : SizedBox(),
                                  ),
                                );
                              }
                            },
                          );
                        }

                        return const SizedBox();
                      },
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNotificationItem extends StatelessWidget {
  final NotificationItem notification;

  const CustomNotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final isRead = context.select<MarkNotificationCubit, bool>(
      (cubit) => cubit.isRead(notification.id),
    );

    return isRead
        ? CustomNotificationUnSelected(notification: notification)
        : CustomNotificationSelected(notification: notification);
  }
}

class CustomNotificationSelected extends StatelessWidget {
  const CustomNotificationSelected({super.key, required this.notification});

  final NotificationItem notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: R.colors.colorUnSelected,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.data.title,
                  style: R.textStyles.font12Grey3W500Light,
                ),
                Text(
                  notification.data.body,
                  style: R.textStyles.font14BlackW500Light,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<MarkNotificationCubit>().markSingleNotification(
                id: notification.id,
              );
              Navigator.pushNamed(
                context,
                AppRoutes.invoiceDetailsScreenRoute,
                arguments: notification,
              );
            },
            child: Text('اضغط', style: R.textStyles.font14primaryW500Light),
          ),
        ],
      ),
    );
  }
}

class CustomNotificationUnSelected extends StatelessWidget {
  const CustomNotificationUnSelected({super.key, required this.notification});

  final NotificationItem notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: R.colors.blackColor3,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.data.title,
                  style: R.textStyles.font12Grey3W500Light,
                ),
                Text(
                  notification.data.body,
                  style: R.textStyles.font14BlackW500Light,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              extractIdFromUrl(
                notification.data.actions[0].url,
                context,
              );
              log('==============${notification.data.actions[0].url}');
              context.read<MarkNotificationCubit>().markSingleNotification(
                id: notification.id,
              );
              // Navigator.pushNamed(
              //   context,
              //   AppRoutes.invoiceDetailsScreenRoute,
              //   // arguments: notification,
              // );
            },
            child: Text('اضغط', style: R.textStyles.font14primaryW500Light),
          ),
        ],
      ),
    );
  }
}

void extractIdFromUrl(String url, BuildContext context) {
  Uri uri = Uri.parse(url);
  List<String> pathSegments = uri.pathSegments;

  if (pathSegments.length >= 2) {
    String type = pathSegments[1]; // 'invoice' أو أي جزء ثابت
    String id =
        pathSegments.last; // القيمة المتغيرة (FZnlS9T7fZ أو INV-32651428)

    if (pathSegments.contains('invoice')) {
      print("فاتورة - المعرف: $id"); // INV-32651428
    } else {
      print("مزاد - المعرف: $id");

      Navigator.pushNamed(
        context,
        AppRoutes.homeDetailsReadyScreenRoute,
        // arguments: notification,
      );
      // FZnlS9T7fZ
    }
  } else if (pathSegments.isNotEmpty) {
    print("مزاد - المعرف: ${pathSegments.last}"); // FZnlS9T7fZ
  }
}

Widget _customAppBar({required String title, context}) {
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(title, style: R.textStyles.font18blackW500Light),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(R.images.backIcon),
            ),
          ),
        ],
      ),
    ),
  );
}
