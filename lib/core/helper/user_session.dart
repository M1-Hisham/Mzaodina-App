import 'package:mzaodina_app/core/constant/shared_preferences_key.dart';

import 'shaerd_pref_helper.dart';

class UserSession {
  static Future<bool> isLoggedIn() async {
    final token = await SharedPrefHelper.getSecuredString(
      SharedPreferencesKeys.authToken,
    );
    return token != null && token.isNotEmpty;
  }

  static Future<void> logout() async {
    await SharedPrefHelper.clearAllSecuredData();
  }
}
