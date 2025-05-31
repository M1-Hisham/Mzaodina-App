import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/auth/google/data/repo/google_repo.dart';
import 'package:mzaodina_app/feature/auth/google/view-model/google_cubit/google_cubit_state.dart';

class GoogleCubit extends Cubit<GoogleCubitState> {
  final GoogleRepo googleRepo;

  GoogleCubit(this.googleRepo) : super(LoginInitial());

  Future<void> login(Map<String, dynamic> body) async {
    emit(LoginLoading());

    final result = await googleRepo.googleRepo(body);

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
