import 'shaerd_pref_helper.dart';

class UserSession {
  static Future<bool> isLoggedIn() async {
    final token = await SharedPrefHelper.getSecuredString('auth_token');
    return token != null && token.isNotEmpty;
  }

  static Future<void> logout() async {
    await SharedPrefHelper.clearAllSecuredData();
  }
}
