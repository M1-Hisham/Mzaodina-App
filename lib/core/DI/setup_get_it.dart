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
}
