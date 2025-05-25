import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/helper/notification_helper.dart';
import 'package:mzaodina_app/feature/notifications/ui/view/widget/messaging_config.dart';
import 'package:mzaodina_app/firebase_options.dart';
import 'package:mzaodina_app/mzaodina_app.dart';

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // تهيئة الـ Messaging
  await NotificationHelper.initializeAndGetFcmToken();
  MessagingConfig.initFirebaseMessaging();

  // معالجة الخلفية
  FirebaseMessaging.onBackgroundMessage(MessagingConfig.messageHandler);
  runApp(
    ScreenUtilInit(
      designSize: Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      ensureScreenSize: true,
      enableScaleText: () => true,
      builder: (context, child) => MzaodinaApp(),
    ),
  );
}
