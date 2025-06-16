import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/auth/login/data/model/login_response_model.dart';
import 'package:mzaodina_app/feature/auth/register/data/model/register_model.dart';
import 'package:mzaodina_app/feature/auth/register/data/repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;
  Future<void> register(RegisterModel body) async {
    emit(RegisterLoading());

    final result = await registerRepo.register(body);

    result.fold(
      (failure) {
        emit(RegisterError(failure.errMessage, failure));
      },
      (response) {
        log('Token saved successfully!: ${response.accessToken}');
        emit(RegisterSuccess(response));
      },
    );
  }
}
