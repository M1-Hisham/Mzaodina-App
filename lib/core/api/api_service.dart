import 'package:dio/dio.dart';
import 'package:mzaodina_app/core/api/api_constants.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/data/model/forgot_password_response.dart';
import 'package:mzaodina_app/feature/auth/register/data/model/register_model.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/model/bidding_response_model.dart';
import 'package:mzaodina_app/feature/home/data/model/tap_checkout_url_model.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/model/auctions_bidding_body.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/model/auctions_bidding_history_model.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/model/jaraa_show_auction_model.dart';
import 'package:mzaodina_app/feature/home/home_details/muntahi/data/model/muntahi_show_auction_model.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/model/register_to_aution_model.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/model/qagim_show_action_model.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/model/jaraa_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/muntahi/data/model/muntahi_auctions_response.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/model/qadim_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/model/subscribe_aution_body.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/data/model/sayantaliq_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/data/model/sayantaliq_show_auction_mode.dart';
import 'package:mzaodina_app/feature/notifications/data/model/get_all_notification_model.dart';
import 'package:mzaodina_app/feature/notifications/data/model/mark_notification.dart';
import 'package:mzaodina_app/feature/notifications/data/model/save_token_responce_model.dart';
import 'package:mzaodina_app/feature/profile/change-password/data/model/change_password_model.dart';
import 'package:mzaodina_app/feature/auth/login/data/model/login_request_body.dart';
import 'package:mzaodina_app/feature/auth/login/data/model/login_response_model.dart';
import 'package:mzaodina_app/feature/profile/data/model/password_update_response.dart';
import 'package:mzaodina_app/feature/profile/data/model/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

/// This is the API service class that handles all the API calls.
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(
    Dio dio, {
    ParseErrorLogger? errorLogger,
    String? baseUrl,
  }) = _ApiService;

  // =================== Auth ===================

  /// service for apple login
  @POST(ApiConstants.appleLogin)
  Future<LoginResponseModel> appleLogin(@Body() Map<String, dynamic> body);

  /// service for google login
  @POST(ApiConstants.googleLogin)
  Future<LoginResponseModel> googleLogin(@Body() Map<String, dynamic> body);

  /// service for login
  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestBody loginRequestBody);

  /// service for register
  @POST(ApiConstants.register)
  Future<LoginResponseModel> register(
    @Body() RegisterModel changePasswordModel,
  );

  /// service for logout
  @POST(ApiConstants.logout)
  Future<void> logout();

  /// service for forgotPassword
  @POST(ApiConstants.forgotPassword)
  Future<ForgotPasswordResponse> forgotPassword(@Query("email") String email);

  // =================== Profile ===================

  /// service for ProfileUserData
  @POST(ApiConstants.profileUserData)
  Future<UserModel> profileUserData();

  /// service for ChangePassword
  @POST(ApiConstants.changePassword)
  Future<PasswordUpdateResponse> changePassword(
    @Body() ChangePasswordModel changePasswordModel,
  );

  // =================== notifications ===================

  @POST(ApiConstants.notificationsSaveToken)
  Future<SaveTokenResponceModel> saveFcmToken(
    @Query("token") String token,
    @Query("provider") String provider,
  );

  @GET(ApiConstants.getAllNotifications)
  Future<GetAllNotificationModel> getAllNotifications();

  @GET(ApiConstants.markAllReadNotifications)
  Future<MarkNotificationModel> markAllReadNotifications();

  @POST(ApiConstants.markAsReadNotifications)
  Future<MarkNotificationModel> markAsReadNotifications(@Path("id") String id);

  // =================== Home ===================

  /// service for auctions Qadim
  @GET(ApiConstants.auctions)
  Future<QadimAuctionResponse> getNotStartAuctions({
    @Query("filter") String filter = "notstart",
  });

  /// service for auctions Sayantaliq
  @GET(ApiConstants.auctions)
  Future<SayantaliqAuctionResponse> getReadyAuctions({
    @Query("filter") String filter = "ready",
  });

  /// service for auctions Jaraa
  @GET(ApiConstants.auctions)
  Future<JaraaAuctionResponse> getOngoingAuctions({
    @Query("filter") String filter = "ongoing",
  });

  /// service for auctions Muntahi
  @GET(ApiConstants.auctions)
  Future<MuntahiAuctionsResponse> getFinishedAuctions({
    @Query("filter") String filter = "finished",
  });

  @GET(ApiConstants.showAuctions)
  Future<QadimShowAuctionModel> getQadimShowAuction(@Path("slug") String slug);

  @GET(ApiConstants.showAuctions)
  Future<MuntahiShowAuctionModel> getMuntahiShowAuction(
    @Path("slug") String slug,
  );
  @GET(ApiConstants.showAuctions)
  Future<JaraaShowAuctionModel> getJaraaShowAuction(@Path("slug") String slug);

  @GET(ApiConstants.showAuctions)
  Future<SayantaliqShowAuctionMode> getSayantaliqShowAuction(
    @Path("slug") String slug,
  );

  @POST(ApiConstants.registerAuctions)
  Future<RegisterToAutionModel> registerToAuctions(@Path("slug") String slug);

  @POST(ApiConstants.subscribeAuctions)
  Future<TapCheckoutUrlModel> subscribe(
    @Body() SubscribeAutionBody subscribeAutionBody,
  );

  @POST(ApiConstants.auctionsBidding)
  Future<AuctionBiddingResponseModel> auctionsBidding(
    @Body() AuctionsBiddingBody auctionsBiddingBody,
  );

  @GET(ApiConstants.auctionsBiddingHistory)
  Future<AuctionsBiddingHistoryModel> auctionsBiddingHistory(
    @Path("slug") String slug,
  );
}
