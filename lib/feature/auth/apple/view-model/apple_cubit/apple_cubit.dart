import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/auth/apple/data/repo/apple_repo.dart';
import 'package:mzaodina_app/feature/auth/apple/view-model/apple_cubit/apple_cubit_state.dart';

class AppleCubit extends Cubit<AppleCubitState> {
  final AppleRepo appleRepo;

  AppleCubit(this.appleRepo) : super(LoginInitial());

  Future<void> login(Map<String, dynamic> body) async {
    emit(LoginLoading());

    final result = await appleRepo.appleLogin(body);

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
