/// Api Constants
class ApiConstants {
  /// base url of the api
  static const String baseUrl = "https://mzaodin.com/api/v1";
  // endpoints
  static const String login = "/auth/login";
  static const String appleLogin = "/auth/apple";
  static const String register = "/auth/register";
  static const String logout = "/auth/logout";
  static const String profileUserData = "/user/data";
  static const String changePassword = "/user/change/password";
  static const String forgotPassword = "/user/forgot/password";
  static const String auctions = "/auctions";
  static const String showAuctions = "/auctions/{slug}";
  static const String registerAuctions = "/auctions/{slug}/register";
  static const String notificationsSaveToken = "/user/notifications/save/token";
  static const String getAllNotifications = "/user/notifications";
  static const String markAllReadNotifications =
      "/user/notifications/mark-all-as-read";
  static const String markAsReadNotifications = "/user/notifications/{id}";
}
