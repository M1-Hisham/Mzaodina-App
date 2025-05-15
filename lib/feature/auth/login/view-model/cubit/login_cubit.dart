import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/auth/login/view-model/cubit/login_cubit_state.dart';
import 'package:mzaodina_app/feature/auth/login/view-model/data/model/login_request_body.dart';
import '../../../../../../core/api/dio_factory.dart';
import '../../../../../../core/api/api_service.dart';
import 'package:mzaodina_app/core/helper/shaerd_pref_helper.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(LoginRequestBody body) async {
    emit(LoginLoading());
    try {
      final dio = await DioFactory.getDio();
      final api = ApiService(dio);
      final response = await api.login(body);

      // Save token if login is successful and token exists
      if (response.accessToken != null && response.accessToken!.isNotEmpty) {
        await SharedPrefHelper.setSecuredString(
          'auth_token',
          response.accessToken!,
        );
        log('Token saved successfully!: ${response.accessToken}');
      }

      emit(LoginSuccess(response));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
