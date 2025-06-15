import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_erorr_widget.dart';
import 'package:mzaodina_app/core/widgets/shimmer/notifications_shimmer.dart';
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
                  context
                      .read<MarkNotificationCubit>()
                      .markAllNotifications(allIds)
                      .then((_) {
                        // Refresh notifications after marking all as read
                        cubit.fetchNotifications(1);
                      });
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
    final isRead = notification.readAt != null;

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
    return InkWell(
      onTap: () {
        context
            .read<MarkNotificationCubit>()
            .markSingleNotification(id: notification.id)
            .then((_) {
              // Refresh notifications after marking as read
              context.read<GetNotificationCubit>().fetchNotifications(1);
            });
        if (notification.data.actions.isNotEmpty) {
          final url = notification.data.actions[0].url;
          extractIdFromUrl(url, context);
        } else {
          // If no URL is available, go to home
          Navigator.pushNamed(context, AppRoutes.homeRoute);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: R.colors.colorUnSelected,
          borderRadius: BorderRadius.circular(8.r),
        ),
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
    );
  }
}

class CustomNotificationUnSelected extends StatelessWidget {
  const CustomNotificationUnSelected({super.key, required this.notification});

  final NotificationItem notification;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('==============${notification.data.actions[0].url}');
        context
            .read<MarkNotificationCubit>()
            .markSingleNotification(id: notification.id)
            .then((_) {
              // Refresh notifications after marking as read
              context.read<GetNotificationCubit>().fetchNotifications(1);
            });
        if (notification.data.actions.isNotEmpty) {
          final url = notification.data.actions[0].url;
          extractIdFromUrl(url, context);
        } else {
          // If no URL is available, go to home
          Navigator.pushNamed(context, AppRoutes.homeRoute);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: R.colors.blackColor3,
          borderRadius: BorderRadius.circular(8.r),
        ),
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
    );
  }
}

void extractIdFromUrl(String url, BuildContext context) {
  if (url == '#') {
    Navigator.pushNamed(context, AppRoutes.homeRoute);
    return;
  }

  Uri uri = Uri.parse(url);
  List<String> pathSegments = uri.pathSegments;

  if (pathSegments.isEmpty) {
    Navigator.pushNamed(context, AppRoutes.homeRoute);
    return;
  }

  // Handle invoice URLs
  if (pathSegments.contains('invoice')) {
    String invoiceId = pathSegments.last;
    Navigator.pushNamed(context, AppRoutes.invoiceDetailsScreenRoute);
    return;
  }

  // Handle shipping URLs
  if (pathSegments.contains('shipping')) {
    Navigator.pushNamed(
      context,
      AppRoutes.completeShippingInformationScreenRoute,
    );
    return;
  }

  // Default to home if no specific pattern matches
  Navigator.pushNamed(context, AppRoutes.homeRoute);
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
