/// Api Constants
class ApiConstants {
  /// base url of the api
  static const String baseUrl = "https://mzaodin.com/api/v1";
  // endpoints
  static const String login = "/auth/login";
  static const String appleLogin = "/auth/login/apple/callback";
  static const String googleLogin = "/auth/login/google/callback";
  static const String register = "/auth/register";
  static const String logout = "/auth/logout";
  static const String profileUserData = "/user/data";
  static const String profileUpdate = "/user/update/profile";
  static const String changePassword = "/user/change/password";
  static const String forgotPassword = "/user/forgot/password";
  static const String auctions = "/auctions";
  static const String auctionsCount = "/auctions/count";
  static const String auctionsBidding = "/auctions/bidding";
  static const String auctionsBiddingHistory =
      "/auctions/bidding/{slug}/history";
  static const String showAuctions = "/auctions/{slug}";
  static const String registerAuctions = "/auctions/{slug}/register";
  static const String subscribeAuctions = "/auctions/subscribe";
  static const String notificationsSaveToken = "/user/notifications/save/token";
  static const String getAllNotifications = "/user/notifications";
  static const String markAllReadNotifications =
      "/user/notifications/mark-all-as-read";
  static const String markAsReadNotifications = "/user/notifications/{id}";
  static const String lastIinvoice = "/invoice/exist/checker";
  static const String paymentIinvoice = "/invoice/pay";
  static const String aboutUs = "/pages/about-us";
  static const String auctionTerms = "/pages/auction-terms";
  static const String privacy = "/pages/privacy";
  static const String terms = "/pages/terms";
  static const String shippingAndReturn = "/pages/shipping-and-return";
}
