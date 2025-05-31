import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/auth/login/ui/view-model/login_cubit/login_cubit_state.dart';
import 'package:mzaodina_app/feature/auth/login/data/model/login_request_body.dart';
import 'package:mzaodina_app/feature/auth/login/data/repo/lodin_repo.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginInitial());

  Future<void> login(LoginRequestBody body) async {
    emit(LoginLoading());

    final result = await loginRepo.login(body);

    result.fold(
      (failure) {
        emit(LoginError(failure.errMessage));
      },
      (response) {
        log('Token saved successfully!: ${response.accessToken}');
        emit(LoginSuccess(response));
      },
    );
  }
}
