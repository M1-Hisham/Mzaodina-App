import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mzaodina_app/core/helper/shaerd_pref_helper.dart';
import 'package:mzaodina_app/core/constant/shared_preferences_key.dart';

class NotificationHelper {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<String?> initializeAndGetFcmToken() async {
    // اطلب إذن الإشعارات
    log('Notification permission status: =============');

    if (Platform.isIOS) {
      String? apnsToken = await _messaging.getAPNSToken();
      log('📲 APNs Token: $apnsToken');
    }

    final settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    log('Notification permission status: ${settings.authorizationStatus}');
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('✅ تم منح الإذن الكامل للإشعارات');
      final token = await _messaging.getToken();
      if (token != null) {
        await SharedPrefHelper.setSecuredString(
          SharedPreferencesKeys.fcmToken,
          token,
        );
      }
      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
        log('🔄 New FCM Token: $newToken');
        SharedPrefHelper.setSecuredString(
          SharedPreferencesKeys.fcmToken,
          newToken,
        );
        // كمان ممكن تبعتيه للسيرفر هنا لو محتاجة
      });
      return token;
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('ℹ️ تم منح إذن مؤقت للإشعارات');
    } else {
      log('❌ تم رفض الإذن أو لم يتم تحديده');
    }
    return null;
  }
}
