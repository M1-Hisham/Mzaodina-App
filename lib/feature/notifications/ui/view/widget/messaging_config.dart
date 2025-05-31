import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
      log("📢 Ready to show notification with: ${message.notification?.title}");

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

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class NotificationService {
//   NotificationService._privateConstructor();
//   static final NotificationService instance =
//       NotificationService._privateConstructor();

//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> initialize() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       showNotification(message);
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       // التعامل مع فتح التطبيق من خلال الإشعار
//     });
//   }

//   Future<void> showNotification(RemoteMessage message) async {
//     const AndroidNotificationDetails
//     androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'high_importance_channel', // يجب أن يتطابق مع القيمة في AndroidManifest.xml
//       'High Importance Notifications',
//       channelDescription: 'This channel is used for important notifications.',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );

//     const NotificationDetails platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//     );

//     await _flutterLocalNotificationsPlugin.show(
//       message.notification.hashCode,
//       message.notification?.title,
//       message.notification?.body,
//       platformChannelSpecifics,
//     );
//   }
// }
