// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:mzaodina_app/core/resources/resources.dart';
// import 'package:mzaodina_app/core/router/app_routes.dart';

// class NotificationsScreen extends StatelessWidget {
//   const NotificationsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: R.colors.whiteLight,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             _customAppBar(title: 'الإشعارات', context: context),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 12.w),
//                       decoration: BoxDecoration(
//                         color: R.colors.blackColor3,

//                         borderRadius: BorderRadius.circular(8.r),
//                       ),
//                       child: Row(
//                         children: [
//                           Text(
//                             'تم اختيارك للفوز – أكمل الآن واحتفل بجائزتك!',
//                             style: R.textStyles.font14BlackW500Light,
//                           ),
//                           Spacer(),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pushNamed(
//                                 context,
//                                 AppRoutes.invoiceDetailsScreenRoute,
//                               );
//                             },
//                             child: Text(
//                               'اضغط',
//                               style: R.textStyles.font14primaryW500Light,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     Padding(
//                       padding: EdgeInsets.only(top: 20.h),
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: 12.w),
//                         decoration: BoxDecoration(
//                           color: R.colors.blackColor3,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Row(
//                           children: [
//                             Text(
//                               'تم اختيارك للفوز – أكمل الآن واحتفل بجائزتك!',
//                               style: R.textStyles.font14BlackW500Light,
//                             ),
//                             Spacer(),
//                             TextButton(
//                               onPressed: () {},
//                               child: Text(
//                                 'اضغط',
//                                 style: R.textStyles.font14primaryW500Light,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_erorr_widget.dart';
import 'package:mzaodina_app/core/widgets/shimmer/notifications_shimmer.dart';
import 'package:mzaodina_app/feature/notifications/data/model/get_all_notification_model.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/get_notification_cubit/get_notification_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/mark_notification_cubit/mark_notification_cubit.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
                child: BlocBuilder<
                  GetNotificationCubit,
                  GetAllNotificationState
                >(
                  builder: (context, state) {
                    if (state is GetAllNotificationLoading) {
                      return Center(child: NotificationsShimmer());
                    } else if (state is GetAllNotificationFailure) {
                      return CustomErorrWidget(
                        message: 'لا توجد اشعارات جديدة',
                        onRefresh: () => cubit.fetchNotifications(1),
                      );
                    } else if (state is GetAllNotificationSuccess) {
                      final notifications = state.response.notifications.data;
                      final currentPage = cubit.currentPage;
                      final totalPages = cubit.totalPages;

                      if (notifications.isEmpty) {
                        return Center(
                          child: Text(
                            'لا توجد إشعارات جديدة',
                            style: R.textStyles.font14BlackW500Light,
                          ),
                        );
                      }

                      return Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              itemCount: notifications.length,
                              separatorBuilder:
                                  (_, __) => SizedBox(height: 12.h),
                              itemBuilder: (context, index) {
                                final notification = notifications[index];
                                return CustomNotificationItem(
                                  notification: notification,
                                );
                              },
                            ),
                          ),

                          SizedBox(height: 14),

                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 15,
                            children: List.generate(totalPages, (index) {
                              final page = index + 1;
                              final isSelected = page == currentPage;

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    cubit.fetchNotifications(page);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? R.colors.primaryColorLight
                                              : Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      '$page',
                                      style: TextStyle(
                                        color:
                                            isSelected
                                                ? Colors.white
                                                : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),

                          SizedBox(height: 25.h),
                        ],
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
