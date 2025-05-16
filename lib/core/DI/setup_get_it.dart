import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/api/dio_factory.dart';
import 'package:mzaodina_app/feature/auth/login/view-model/cubit/login_cubit.dart';
import 'package:mzaodina_app/feature/auth/login/view-model/data/repo/lodin_repo.dart';
import 'package:mzaodina_app/feature/profile/data/repo/user_data_repo.dart';
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

  // ✅ Register Cubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // // User Data Cubit Instance

  // getIt.registerLazySingleton<UserCubit>(() => UserCubit()..loadUserData());

  // // Api Service Instance
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // // image picker cubit instance
  // getIt.registerLazySingleton<ImagePickerCubit>(() => ImagePickerCubit());

  // // show fields cubit instance
  // getIt.registerLazySingleton<ShowFieldsCubit>(() => ShowFieldsCubit());

  // // Auth Module Instance
  // setupAuthModule();

  // // Dashboard module instance
  // setupDashboardModule();

  // // Leads module instance
  // setupLeadsModule();

  // // Contacts module instance
  // setupContactModule();

  // // Client module instance
  // setupClientModule();

  // // Tasks module instance
  // setupTasksModule();

  // // Meetings module instance
  // setupMeetingsModule();

  // // Calls module instance
  // setupCallsModule();

  // // Campaigns module instance
  // setupCampaignsModule();

  // //Payment Plans module instance
  // setupPaymentPlansModule();

  // //Projects module instance
  // setupProjectsModule();

  // // Deal module instance
  // setupDealsModule();

  // // Broker module instance
  // setupBrokersModule();

  // // Profile module instance
  // setupProfileModule();
}
