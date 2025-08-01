import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/api/dio_factory.dart';
import 'package:mzaodina_app/feature/auth/apple/data/repo/apple_repo.dart';
import 'package:mzaodina_app/feature/auth/apple/view-model/apple_cubit/apple_cubit.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/data/repo/forgot_password_repo.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/ui/view_model/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:mzaodina_app/feature/auth/google/data/repo/google_repo.dart';
import 'package:mzaodina_app/feature/auth/google/view-model/google_cubit/google_cubit.dart';
import 'package:mzaodina_app/feature/auth/login/ui/view-model/login_cubit/login_cubit.dart';
import 'package:mzaodina_app/feature/auth/register/data/repo/register_repo.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/register_cubit/register_cubit.dart';
import 'package:mzaodina_app/feature/home/data/repo/actions_count_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/repo/auction_bidding_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/repo/auctions_bidding_history_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/repo/ongoing_show_auction_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/auction_bidding_cubit/auction_bidding_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/auctions_bidding_history_cubit/auctions_bidding_history_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/ongoing_show_auction_cubit/ongoing_show_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/repo/finished_show_auction_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/ui/view_model/finished_show_auction_cubit/finished_show_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/repo/notstart_show_action_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/repo/ongoing_auction_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/ongoing_cubit/ongoing_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/repo/finished_auction_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/ui/view_model/finished_cubit/finished_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/repo/notstart_auction_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/repo/register_to_auction_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/repo/subscribe_to_auction_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/notstart_cubit/notstart_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/register_to_auction_cubit/register_to_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/subscribe_auction-cubit/subscribe_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/repo/ready_aution_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/repo/ready_show_aution_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view_model/ready_cubit/ready_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/notstart_show_auction_cubit/notstart_show_action_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view_model/ready_show_austion_cubit/ready_show_austion_cubit.dart';
import 'package:mzaodina_app/feature/home/ui/view_model/actions-count-cubit/actions_count_cubit.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/get_notification_repo.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/mark_notifacation_repo.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/notification_repo.dart';
import 'package:mzaodina_app/feature/notifications/payment/data/repo/last_invoice_repo.dart';
import 'package:mzaodina_app/feature/notifications/payment/data/repo/payment_invoice_repo.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view_model/Last_invoice_cubit/last_invoice_cubit.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view_model/payment_invoice_cubit/payment_invoice_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/get_notification_cubit/get_notification_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/mark_notification_cubit/mark_notification_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/save_token_cubit/save_token_cubit.dart';
import 'package:mzaodina_app/feature/profile/account-details/data/repo/update_profile_repo.dart';
import 'package:mzaodina_app/feature/profile/account-details/view_model/update_profile_cubit/update_profile_cubit.dart';
import 'package:mzaodina_app/feature/profile/change-password/data/repo/change_password_repo.dart';
import 'package:mzaodina_app/feature/auth/login/data/repo/lodin_repo.dart';
import 'package:mzaodina_app/feature/profile/data/repo/info_repo.dart';
import 'package:mzaodina_app/feature/profile/data/repo/user_data_repo.dart';
import 'package:mzaodina_app/feature/profile/change-password/view_model/change_password_cubit/change_password_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/about_us_cubit/about_us_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/auction_terms_cubit/auction_terms_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/privacy_cubit/privacy_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/shipping_cubit/shipping_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/terms_cubit/terms_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/user_data_cubit/user_data_cubit.dart';

/// This is the dependency injection file for the app.
final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio Instance
  Dio dio = await DioFactory.getDio();

  // ✅ Register ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // ✅ Register UserDataRepo
  getIt.registerLazySingleton<UserDataRepo>(
    () => UserDataRepo(getIt<ApiService>()),
  );

  // ✅ Register Cubit
  getIt.registerFactory<UserDataCubit>(
    () => UserDataCubit(getIt<UserDataRepo>()),
  );

  // ✅ Register Appl LoginRepo
  getIt.registerLazySingleton<AppleRepo>(() => AppleRepo(getIt<ApiService>()));

  // ✅ Register Apple LoginCubit
  getIt.registerFactory<AppleCubit>(() => AppleCubit(getIt<AppleRepo>()));

  // ✅ Register Google LoginRepo
  getIt.registerLazySingleton<GoogleRepo>(
    () => GoogleRepo(getIt<ApiService>()),
  );
  // ✅ Register Google LoginCubit
  getIt.registerFactory<GoogleCubit>(() => GoogleCubit(getIt<GoogleRepo>()));

  // ✅ Register LoginRepo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));

  // ✅ Register LoginCubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // ✅ Register RegisterRepo
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepo(getIt<ApiService>()),
  );

  // ✅ Register RegisterCubit
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterRepo>()),
  );

  // ✅ Register ChangePasswordRepo
  getIt.registerLazySingleton<ChangePasswordRepo>(
    () => ChangePasswordRepo(getIt<ApiService>()),
  );
  // ✅ ChangePasswordCubit Cubit
  getIt.registerFactory<ChangePasswordCubit>(
    () => ChangePasswordCubit(getIt<ChangePasswordRepo>()),
  );

  // ✅ Register UpdateProfileRepo
  getIt.registerLazySingleton<UpdateProfileRepo>(
    () => UpdateProfileRepo(getIt<ApiService>()),
  );

  // ✅ UpdateProfileCubit Cubit
  getIt.registerFactory<UpdateProfileCubit>(
    () => UpdateProfileCubit(getIt<UpdateProfileRepo>()),
  );

  // ✅ Register ForgotPasswordRepo
  getIt.registerLazySingleton<ForgotPasswordRepo>(
    () => ForgotPasswordRepo(getIt<ApiService>()),
  );
  // ✅ ForgotPasswordCubit Cubit
  getIt.registerFactory<ForgotPasswordCubit>(
    () => ForgotPasswordCubit(getIt<ForgotPasswordRepo>()),
  );

  //  ============Home=================

  // ✅ Register ActionsCountRepo
  getIt.registerFactory<ActionsCountRepo>(
    () => ActionsCountRepo(getIt<ApiService>()),
  );
  // ✅ ActionsCount Cubit
  getIt.registerFactory<ActionsCountCubit>(
    () => ActionsCountCubit(getIt<ActionsCountRepo>()),
  );

  // ✅ Register NotstartRepo
  getIt.registerLazySingleton<NotstartAuctionRepo>(
    () => NotstartAuctionRepo(getIt<ApiService>()),
  );
  // ✅ Notstart Cubit
  getIt.registerFactory<NotstartCubit>(
    () => NotstartCubit(getIt<NotstartAuctionRepo>()),
  );
  // ✅ Register ReadyRepo
  getIt.registerLazySingleton<ReadyAutionRepo>(
    () => ReadyAutionRepo(getIt<ApiService>()),
  );
  // ✅ Ready Cubit
  getIt.registerFactory<ReadyCubit>(() => ReadyCubit(getIt<ReadyAutionRepo>()));
  // ✅ Register OngoingRepo
  getIt.registerLazySingleton<OngoingAuctionRepo>(
    () => OngoingAuctionRepo(getIt<ApiService>()),
  );
  // ✅ Ongoing Cubit
  getIt.registerFactory<OngoingCubit>(
    () => OngoingCubit(getIt<OngoingAuctionRepo>()),
  );
  // ✅ Register FinishedRepo
  getIt.registerLazySingleton<FinishedAuctionRepo>(
    () => FinishedAuctionRepo(getIt<ApiService>()),
  );
  // ✅ Finished Cubit
  getIt.registerFactory<FinishedCubit>(
    () => FinishedCubit(getIt<FinishedAuctionRepo>()),
  );

  //============ShowAuction=================
  // ✅ Register NotstartShowActionRepo
  getIt.registerLazySingleton<NotstartShowActionRepo>(
    () => NotstartShowActionRepo(getIt<ApiService>()),
  );
  // ✅ NotstartShowActionCubit Cubit
  getIt.registerFactory<NotstartShowActionCubit>(
    () => NotstartShowActionCubit(getIt<NotstartShowActionRepo>()),
  );
  // ✅ Register FinishedShowActionRepo
  getIt.registerLazySingleton<FinishedShowAuctionRepo>(
    () => FinishedShowAuctionRepo(getIt<ApiService>()),
  );
  // ✅ FinishedShowActionCubit Cubit
  getIt.registerFactory<FinishedShowAuctionCubit>(
    () => FinishedShowAuctionCubit(getIt<FinishedShowAuctionRepo>()),
  );
  // ✅ Register ReadyShowActionRepo
  getIt.registerLazySingleton<ReadyShowAutionRepo>(
    () => ReadyShowAutionRepo(getIt<ApiService>()),
  );
  // ✅ ReadyShowActionCubit Cubit
  getIt.registerFactory<ReadyShowAustionCubit>(
    () => ReadyShowAustionCubit(getIt<ReadyShowAutionRepo>()),
  );
  // ✅ Register OngoingShowActionRepo
  getIt.registerLazySingleton<OngoingShowAuctionRepo>(
    () => OngoingShowAuctionRepo(getIt<ApiService>()),
  );
  // ✅ OngoingShowActionCubit Cubit
  getIt.registerFactory<OngoingShowAuctionCubit>(
    () => OngoingShowAuctionCubit(getIt<OngoingShowAuctionRepo>()),
  );
  // ✅ Register AuctionsBiddingHistoryRepo
  getIt.registerLazySingleton<AuctionsBiddingHistoryRepo>(
    () => AuctionsBiddingHistoryRepo(getIt<ApiService>()),
  );
  // ✅ AuctionsBiddingHistoryCubit Cubit
  getIt.registerFactory<AuctionsBiddingHistoryCubit>(
    () => AuctionsBiddingHistoryCubit(getIt<AuctionsBiddingHistoryRepo>()),
  );
  // ✅ Register AuctionsBiddingHistoryRepo
  getIt.registerLazySingleton<AuctionBiddingRepo>(
    () => AuctionBiddingRepo(getIt<ApiService>()),
  );
  // ✅ AuctionsBiddingHistoryCubit Cubit
  getIt.registerFactory<AuctionBiddingCubit>(
    () => AuctionBiddingCubit(getIt<AuctionBiddingRepo>()),
  );

  //=================================
  // ✅ Register RegisterToActionRepo
  getIt.registerLazySingleton<RegisterToAuctionRepo>(
    () => RegisterToAuctionRepo(getIt<ApiService>()),
  );
  // ✅ RegisterToAuctionCubit Cubit
  getIt.registerFactory<RegisterToAuctionCubit>(
    () => RegisterToAuctionCubit(getIt<RegisterToAuctionRepo>()),
  );
  // ✅ Subscribe SubscribeToAuctionRepo
  getIt.registerLazySingleton<SubscribeAuctionRepo>(
    () => SubscribeAuctionRepo(getIt<ApiService>()),
  );
  // ✅ SubscribeToAuctionCubit Cubit
  getIt.registerFactory<SubscribeAuctionCubit>(
    () => SubscribeAuctionCubit(getIt<SubscribeAuctionRepo>()),
  );
  // ✅ Register NotificationRepo
  getIt.registerLazySingleton<NotificationRepo>(
    () => NotificationRepo(getIt<ApiService>()),
  );
  // ✅ SaveTokenCubit Cubit
  getIt.registerFactory<SaveTokenCubit>(
    () => SaveTokenCubit(getIt<NotificationRepo>()),
  );
  // ✅ Register GetNotificationRepo
  getIt.registerLazySingleton<GetNotificationRepo>(
    () => GetNotificationRepo(getIt<ApiService>()),
  );
  // ✅ GetNotificationCubit Cubit
  getIt.registerFactory<GetNotificationCubit>(
    () => GetNotificationCubit(getIt<GetNotificationRepo>()),
  );
  // ✅ Register GetNotificationRepo
  getIt.registerLazySingleton<MarkNotifacationRepo>(
    () => MarkNotifacationRepo(getIt<ApiService>()),
  );
  // ✅ GetNotificationCubit Cubit
  getIt.registerFactory<MarkNotificationCubit>(
    () => MarkNotificationCubit(getIt<MarkNotifacationRepo>()),
  );
  // ============= LastInvoiceRepo ==============
  // ✅ Register LastInvoiceRepo
  getIt.registerLazySingleton<LastInvoiceRepo>(
    () => LastInvoiceRepo(getIt<ApiService>()),
  );
  // ✅ LastInvoiceCubit Cubit
  getIt.registerFactory<LastInvoiceCubit>(
    () => LastInvoiceCubit(getIt<LastInvoiceRepo>()),
  );
  // ✅ Register PaymentInvoiceRepo
  getIt.registerLazySingleton<PaymentInvoiceRepo>(
    () => PaymentInvoiceRepo(getIt<ApiService>()),
  );
  // ✅ LastInvoiceCubit Cubit
  getIt.registerFactory<PaymentInvoiceCubit>(
    () => PaymentInvoiceCubit(getIt<PaymentInvoiceRepo>()),
  );
//==================info============

  // ✅ Register InfoRepoRepo
  getIt.registerLazySingleton<InfoRepo>(
    () => InfoRepo(getIt<ApiService>()),
  );
  // ✅ AboutUsCubit Cubit
  getIt.registerFactory<AboutUsCubit>(
    () => AboutUsCubit(getIt<InfoRepo>()),
  );
  // ✅ AuctionTermsCubit Cubit
  getIt.registerFactory<AuctionTermsCubit>(
    () => AuctionTermsCubit(getIt<InfoRepo>()),
  );
  // ✅ PrivacyCubit Cubit
  getIt.registerFactory<PrivacyCubit>(
    () => PrivacyCubit(getIt<InfoRepo>()),
  );
  // ✅ ShippingCubit Cubit
  getIt.registerFactory<ShippingCubit>(
    () => ShippingCubit(getIt<InfoRepo>()),
  );
  // ✅ TermsCubit Cubit
  getIt.registerFactory<TermsCubit>(
    () => TermsCubit(getIt<InfoRepo>()),
  );

}
