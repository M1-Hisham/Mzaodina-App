import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mzaodina_app/feature/notifications/ui/view/widget/handleNotification.dart';
import 'package:mzaodina_app/main.dart'; // لازم فيه navigatorKey

class MessagingConfig {
  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// إنشاء قناة تنبيهات لـ Android
  static Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'custom_channel',
      'Custom Notifications',
      description: 'This channel plays a custom sound.',
      importance: Importance.max,
      sound: RawResourceAndroidNotificationSound('notifigation'), // بدون امتداد
      playSound: true,
      enableVibration: true,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  /// تهيئة الإشعارات
  static Future<void> initFirebaseMessaging() async {
    try {
      await _createNotificationChannel();

      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      const DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
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
          if (response.payload != null) {
            try {
              final Map<String, dynamic> payload = Map<String, dynamic>.from(
                response.payload as Map,
              );
              handleNotification(navigatorKey.currentContext!, payload);
            } catch (e) {
              log("❌ Error parsing notification payload: $e");
            }
          }
        },
      );

      // 🔔 التطبيق شغال (foreground)
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        log("📲 Foreground message received: ${message.messageId}");
        await _showNotification(message);
        handleNotification(navigatorKey.currentContext!, message.data);
      });

      // 💤 التطبيق كان مقفول وفتح من إشعار
      FirebaseMessaging.instance.getInitialMessage().then((message) {
        if (message != null) {
          log("📦 Initial message received: ${message.messageId}");
          handleNotification(navigatorKey.currentContext!, message.data);
        }
      });

      // 🔁 المستخدم فتح الإشعار من الخلفية
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        log("➡️ Notification clicked (background): ${message.messageId}");
        handleNotification(navigatorKey.currentContext!, message.data);
      });

      // Set foreground notification presentation options
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
            alert: true,
            badge: true,
            sound: true,
          );
    } catch (e) {
      log("❌ Error initializing Firebase Messaging: $e");
    }
  }

  /// عرض الإشعار في foreground
  static Future<void> _showNotification(RemoteMessage message) async {
    try {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      log("📢 Showing notification: ${message.notification?.title}");

      if (notification != null) {
        log("🔔 Preparing to show notification with sound...");
        await _flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              'custom_channel',
              'Custom Notifications',
              channelDescription: '...',
              importance: Importance.max,
              priority: Priority.high,
              playSound: true,

              icon: '@mipmap/ic_launcher',
              sound: const RawResourceAndroidNotificationSound('notifigation'),
        
              enableVibration: true,

              enableLights: true,
              color: const Color(0xFFFF0000),
              styleInformation: BigTextStyleInformation(
                notification.body ?? '',
                htmlFormatBigText: true,
                contentTitle: notification.title,
                htmlFormatContentTitle: true,
              ),
            ),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
              sound:
                  'notifigation.mp3', // تأكد من وجود الملف في مجلد ios/Runner/Resources
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
    log('�� Background message received: ${message.messageId}');
    // Store the message data for later use when the app is opened
    // You might want to use shared preferences or a local database
    try {
      // Here you can store the message data to be processed when the app is opened
      // For example, using SharedPreferences or a local database
      log('Message data: ${message.data}');
    } catch (e) {
      log('❌ Error handling background message: $e');
    }
  }
}
