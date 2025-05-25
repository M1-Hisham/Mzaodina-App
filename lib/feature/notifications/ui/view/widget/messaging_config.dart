// import 'dart:developer';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class MessagingConfig {
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> createNotificationChannel() async {
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       description: 'This channel is used for important notifications.',
//       sound: RawResourceAndroidNotificationSound('custom_sound'),
//       importance: Importance.max,
//     );

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin
//         >()
//         ?.createNotificationChannel(channel);
//   }

//   static Future<void> initFirebaseMessaging() async {
//     await createNotificationChannel();

//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     // NotificationSettings settings = await messaging.requestPermission(
//     //   alert: true,
//     //   announcement: false,
//     //   badge: true,
//     //   carPlay: false,
//     //   criticalAlert: false,
//     //   provisional: false,
//     //   sound: true,
//     // );

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//           requestSoundPermission: false,
//           requestBadgePermission: false,
//           requestAlertPermission: false,
//         );

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//           android: initializationSettingsAndroid,
//           iOS: initializationSettingsIOS,
//         );

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse payload) {
//         log("payload1: ${payload.payload.toString()}");
//         return;
//       },
//     );

//     // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     //   log('User granted permission');
//     // } else if (settings.authorizationStatus ==
//     //     AuthorizationStatus.provisional) {
//     //   log('User granted provisional permission');
//     // } else {
//     //   log('User declined or has not accepted permission');
//     // }

//     FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
//       log("message received");
//       try {
//         RemoteNotification? notification = event.notification;
//         AndroidNotification? android = event.notification?.android;
//         log(notification!.body.toString());

//         log(notification.title.toString());

//         var body = notification.body;

//         await flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           body,
//           const NotificationDetails(
//             android: AndroidNotificationDetails(
//               'high_importance_channel',
//               'High Importance Notifications',
//               channelDescription:
//                   'This channel is used for important notifications.',
//               sound: RawResourceAndroidNotificationSound('custom_sound'),
//               icon: '@mipmap/ic_launcher',
//             ),
//             iOS: DarwinNotificationDetails(
//               presentAlert: true,
//               presentBadge: true,
//               presentSound: true,
//               sound: 'custom_sound.caf',
//             ),
//           ),
//         );

//         // handleNotification(navigatorKey.currentContext!, event.data);
//       } catch (err) {
//         log(err.toString());
//       }
//     });

//     FirebaseMessaging.instance.getInitialMessage().then((
//       RemoteMessage? message,
//     ) {
//       if (message != null) {
//         // handleNotification(navigatorKey.currentContext!, message.data);
//       }
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       // handleNotification(navigatorKey.currentContext!, message.data);
//     });
//   }

//   @pragma('vm:entry-point')
//   static Future<void> messageHandler(RemoteMessage message) async {
//     log('background message ${message.notification!.body}');
//   }
// }
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:mzaodina_app/feature/notifications/ui/view/widget/handleNotification.dart';
import 'package:mzaodina_app/main.dart'; // لازم فيه navigatorKey

class MessagingConfig {
  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// إنشاء قناة تنبيهات لـ Android
  static Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
      sound: RawResourceAndroidNotificationSound('custom_sound'),
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  /// تهيئة الإشعارات
  static Future<void> initFirebaseMessaging() async {
    await _createNotificationChannel();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        );

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        log("🔁 Notification clicked with payload: ${response.payload}");
        // هنا تقدر تبعت الـ payload لـ handleNotification
      },
    );

    // 🔔 التطبيق شغال (foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      log("📲 Foreground message received");
      _showNotification(message);
      handleNotification(navigatorKey.currentContext!, message.data);
    });

    // 💤 التطبيق كان مقفول وفتح من إشعار
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        log("📦 Initial message received");
        handleNotification(navigatorKey.currentContext!, message.data);
      }
    });

    // 🔁 المستخدم فتح الإشعار من الخلفية
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("➡️ Notification clicked (background)");
      handleNotification(navigatorKey.currentContext!, message.data);
    });
  }

  /// عرض الإشعار في foreground
  static Future<void> _showNotification(RemoteMessage message) async {
    try {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        await _flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel',
              'High Importance Notifications',
              channelDescription:
                  'This channel is used for important notifications.',
              icon: '@mipmap/ic_launcher',
              sound: RawResourceAndroidNotificationSound('custom_sound'),
            ),
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
              sound: 'custom_sound.caf',
            ),
          ),
          payload: message.data.toString(),
        );
      }
    } catch (e) {
      log("❌ Error showing notification: $e");
    }
  }

  /// لمعالجة الرسائل في الخلفية
  @pragma('vm:entry-point')
  static Future<void> messageHandler(RemoteMessage message) async {
    log('📥 Background message: ${message.messageId}');
    // لاحظ إن هنا مفيش context مباشر، لو عايز تخزن حاجة اعملها هنا
  }
}
