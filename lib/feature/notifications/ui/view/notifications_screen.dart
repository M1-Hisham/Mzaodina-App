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
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/get_notification_repo.dart';

import 'package:mzaodina_app/feature/notifications/data/repo/notification_repo.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/get_notification_cubit/get_notification_cubit.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetNotificationCubit(GetNotificationRepo(ApiService(Dio())))
        ..fetchNotifications(),
      child: Scaffold(
        backgroundColor: R.colors.whiteLight,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _customAppBar(title: 'الإشعارات', context: context),
              Expanded(
                child: BlocBuilder<GetNotificationCubit, GetNotificationState>(
                  builder: (context, state) {
                    if (state is NotificationLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is NotificationFailure) {
                      return Center(child: Text("خطأ: ${state.error}"));
                    } else if (state is NotificationSuccess) {
                      final notifications = state.response.data.notifications.data;

                      if (notifications.isEmpty) {
                        return const Center(child: Text("لا توجد إشعارات."));
                      }

                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        itemCount: notifications.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final notification = notifications[index];

                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: R.colors.blackColor3,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'عنوان الإشعار هنا', // Replace with actual title when available
                                    style: R.textStyles.font14BlackW500Light,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // TODO: تحديد الإجراء المناسب عند الضغط
                                  },
                                  child: Text(
                                    'اضغط',
                                    style: R.textStyles.font14primaryW500Light,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink(); // Default fallback
                  },
                ),
              ),
            ],
          ),
        ),
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
