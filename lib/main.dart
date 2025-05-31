import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/helper/notification_helper.dart';
import 'package:mzaodina_app/feature/notifications/ui/view/widget/messaging_config.dart';
import 'package:mzaodina_app/firebase_options.dart';
import 'package:mzaodina_app/mzaodina_app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Ensure Firebase is initialized
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  log('Handling a background message: ${message.messageId}');
  await MessagingConfig.messageHandler(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await MessagingConfig.initFirebaseMessaging();

  await NotificationHelper.initializeAndGetFcmToken();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
