import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/api/dio_factory.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/data/repo/forgot_password_repo.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/ui/view_model/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:mzaodina_app/feature/auth/login/ui/view-model/login_cubit/login_cubit.dart';
import 'package:mzaodina_app/feature/auth/register/data/repo/register_repo.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/register_cubit/register_cubit.dart';
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
}
