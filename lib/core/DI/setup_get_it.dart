import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/api/dio_factory.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/data/repo/forgot_password_repo.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/ui/view_model/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:mzaodina_app/feature/auth/login/ui/view-model/login_cubit/login_cubit.dart';
import 'package:mzaodina_app/feature/auth/register/data/repo/register_repo.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/register_cubit/register_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/repo/jaraa_show_auction_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/ui/view_model/jaraa_show_auction_cubit/jaraa_show_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/muntahi/data/repo/muntahi_show_auction_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/muntahi/ui/view_model/muntahi_shoe_auction_cubit/muntahi_show_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/repo/qadim_show_action_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/repo/jaraa_auction_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/ui/view_model/jaraa_cubit/jaraa_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/muntahi/data/repo/muntahi_auction_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/muntahi/ui/view_model/muntahi_cubit/muntahi_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/repo/qadim_auction_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/repo/register_to_auction_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/repo/subscribe_to_auction_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view_model/qadim_cubit/qadim_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view_model/register_to_auction_cubit/register_to_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view_model/subscribe-to-auction-cubit/subscribe_to_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/data/repo/sayantaliq_aution_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/data/repo/sayantaliq_show_aution_repo.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/ui/view_model/sayantaliq_cubit/sayantaliq_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view_model/qadim_show_auction_cubit/qadim_show_action_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/ui/view_model/sayantaliq_show_austion_cubit/sayantaliq_show_austion_cubit.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/get_notification_repo.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/mark_notifacation_repo.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/notification_repo.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/get_notification_cubit/get_notification_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/mark_notification_cubit/mark_notification_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/save_token_cubit/save_token_cubit.dart';
import 'package:mzaodina_app/feature/profile/change-password/data/repo/change_password_repo.dart';
import 'package:mzaodina_app/feature/auth/login/data/repo/lodin_repo.dart';
import 'package:mzaodina_app/feature/profile/data/repo/user_data_repo.dart';
import 'package:mzaodina_app/feature/profile/change-password/view_model/change_password_cubit/change_password_cubit.dart';
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

  // ✅ Register ForgotPasswordRepo
  getIt.registerLazySingleton<ForgotPasswordRepo>(
    () => ForgotPasswordRepo(getIt<ApiService>()),
  );
  // ✅ ForgotPasswordCubit Cubit
  getIt.registerFactory<ForgotPasswordCubit>(
    () => ForgotPasswordCubit(getIt<ForgotPasswordRepo>()),
  );
  // ✅ Register QadimRepo
  getIt.registerLazySingleton<QadimAuctionRepo>(
    () => QadimAuctionRepo(getIt<ApiService>()),
  );
  // ✅ Qadim Cubit
  getIt.registerFactory<QadimCubit>(
    () => QadimCubit(getIt<QadimAuctionRepo>()),
  );
  // ✅ Register SayantaliqRepo
  getIt.registerLazySingleton<SayantaliqAutionRepo>(
    () => SayantaliqAutionRepo(getIt<ApiService>()),
  );
  // ✅ Sayantaliq Cubit
  getIt.registerFactory<SayantaliqCubit>(
    () => SayantaliqCubit(getIt<SayantaliqAutionRepo>()),
  );
  // ✅ Register JaraaRepo
  getIt.registerLazySingleton<JaraaAuctionRepo>(
    () => JaraaAuctionRepo(getIt<ApiService>()),
  );
  // ✅ Jaraa Cubit
  getIt.registerFactory<JaraaCubit>(
    () => JaraaCubit(getIt<JaraaAuctionRepo>()),
  );
  // ✅ Register MuntahiRepo
  getIt.registerLazySingleton<MuntahiAuctionRepo>(
    () => MuntahiAuctionRepo(getIt<ApiService>()),
  );
  // ✅ Muntahi Cubit
  getIt.registerFactory<MuntahiCubit>(
    () => MuntahiCubit(getIt<MuntahiAuctionRepo>()),
  );

  //============ShowAuction=================
  // ✅ Register QadimShowActionRepo
  getIt.registerLazySingleton<QadimShowActionRepo>(
    () => QadimShowActionRepo(getIt<ApiService>()),
  );
  // ✅ QadimShowActionCubit Cubit
  getIt.registerFactory<QadimShowActionCubit>(
    () => QadimShowActionCubit(getIt<QadimShowActionRepo>()),
  );
  // ✅ Register MuntahiShowActionRepo
  getIt.registerLazySingleton<MuntahiShowAuctionRepo>(
    () => MuntahiShowAuctionRepo(getIt<ApiService>()),
  );
  // ✅ MuntahiShowActionCubit Cubit
  getIt.registerFactory<MuntahiShowAuctionCubit>(
    () => MuntahiShowAuctionCubit(getIt<MuntahiShowAuctionRepo>()),
  );
  // ✅ Register SayantaliqShowActionRepo
  getIt.registerLazySingleton<SayantaliqShowAutionRepo>(
    () => SayantaliqShowAutionRepo(getIt<ApiService>()),
  );
  // ✅ SayantaliqShowActionCubit Cubit
  getIt.registerFactory<SayantaliqShowAustionCubit>(
    () => SayantaliqShowAustionCubit(getIt<SayantaliqShowAutionRepo>()),
  );
  // ✅ Register JaraaShowActionRepo
  getIt.registerLazySingleton<JaraaShowAuctionRepo>(
    () => JaraaShowAuctionRepo(getIt<ApiService>()),
  );
  // ✅ JaraaShowActionCubit Cubit
  getIt.registerFactory<JaraaShowAuctionCubit>(
    () => JaraaShowAuctionCubit(getIt<JaraaShowAuctionRepo>()),
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
  getIt.registerLazySingleton<SubscribeToAuctionRepo>(
    () => SubscribeToAuctionRepo(getIt<ApiService>()),
  );
  // ✅ SubscribeToAuctionCubit Cubit
  getIt.registerFactory<SubscribeToAuctionCubit>(
    () => SubscribeToAuctionCubit(getIt<SubscribeToAuctionRepo>()),
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
}
