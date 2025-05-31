// import 'dart:developer';
// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:mzaodina_app/core/helper/shaerd_pref_helper.dart';
// import 'package:mzaodina_app/core/constant/shared_preferences_key.dart';

// class NotificationHelper {
//   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

//   static Future<String?> initializeAndGetFcmToken() async {
//     // اطلب إذن الإشعارات
//     log('Notification permission status: =============');

//     if (Platform.isIOS) {
//       String? apnsToken = await _messaging.getAPNSToken();
//       log('📲 APNs Token: $apnsToken');
//     }

//     final settings = await _messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     log('Notification permission status: ${settings.authorizationStatus}');
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       log('✅ تم منح الإذن الكامل للإشعارات');
//       final token = await _messaging.getToken();
//       if (token != null) {
//         await SharedPrefHelper.setSecuredString(
//           SharedPreferencesKeys.fcmToken,
//           token,
//         );
//       }
//       FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
//         log('🔄 New FCM Token: $newToken');
//         SharedPrefHelper.setSecuredString(
//           SharedPreferencesKeys.fcmToken,
//           newToken,
//         );
//         // كمان ممكن تبعتيه للسيرفر هنا لو محتاجة
//       });
//       return token;
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       log('ℹ️ تم منح إذن مؤقت للإشعارات');
//     } else {
//       log('❌ تم رفض الإذن أو لم يتم تحديده');
//     }
//     return null;
//   }
// }

import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mzaodina_app/core/helper/shaerd_pref_helper.dart';
import 'package:mzaodina_app/core/constant/shared_preferences_key.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/notification_repo.dart';

class NotificationHelper {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final NotificationRepo _notificationRepo = getIt<NotificationRepo>();

  /// Initialize FCM and request permissions
  static Future<String?> initializeAndGetFcmToken() async {
    try {
      log('Initializing FCM and requesting permissions...');

      // Request permissions based on platform
      if (Platform.isIOS) {
        await _requestIOSPermissions();
      } else if (Platform.isAndroid) {
        await _requestAndroidPermissions();
      }

      // Get and save the FCM token
      final token = await _getAndSaveFcmToken();

      // Set up token refresh listener
      _setupTokenRefreshListener();

      return token;
    } catch (e) {
      log('Error initializing FCM: $e');
      return null;
    }
  }

  /// Request iOS-specific permissions
  static Future<void> _requestIOSPermissions() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    log('iOS Notification permission status: ${settings.authorizationStatus}');

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('✅ Full notification permission granted on iOS');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('ℹ️ Provisional notification permission granted on iOS');
    } else {
      log('❌ Notification permission denied on iOS');
    }
  }

  /// Request Android-specific permissions
  static Future<void> _requestAndroidPermissions() async {
    // For Android 13+ (API level 33+)
    if (Platform.isAndroid) {
      final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      log(
        'Android Notification permission status: ${settings.authorizationStatus}',
      );
    }
  }

  /// Get and save FCM token
  static Future<String?> _getAndSaveFcmToken() async {
    try {
      final token = await _messaging.getToken();
      if (token != null) {
        log('📱 FCM Token: $token');
        await SharedPrefHelper.setSecuredString(
          SharedPreferencesKeys.fcmToken,
          token,
        );
        // Send token to server
        await _notificationRepo.saveFcmToken(token: token);
      }
      return token;
    } catch (e) {
      log('Error getting FCM token: $e');
      return null;
    }
  }

  /// Set up token refresh listener
  static void _setupTokenRefreshListener() {
    _messaging.onTokenRefresh.listen((newToken) async {
      log('🔄 FCM Token refreshed: $newToken');
      await SharedPrefHelper.setSecuredString(
        SharedPreferencesKeys.fcmToken,
        newToken,
      );
      // Send new token to server
      await _notificationRepo.saveFcmToken(token: newToken);
    });
  }

  /// Get the current FCM token
  static Future<String?> getCurrentFcmToken() async {
    return await SharedPrefHelper.getSecuredString(
      SharedPreferencesKeys.fcmToken,
    );
  }

  /// Check if notifications are enabled
  static Future<bool> areNotificationsEnabled() async {
    if (Platform.isIOS) {
      final settings = await _messaging.getNotificationSettings();
      return settings.authorizationStatus == AuthorizationStatus.authorized;
    } else if (Platform.isAndroid) {
      final settings = await _messaging.getNotificationSettings();
      return settings.authorizationStatus == AuthorizationStatus.authorized;
    }
    return false;
  }
}
