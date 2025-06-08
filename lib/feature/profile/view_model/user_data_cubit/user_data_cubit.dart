import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mzaodina_app/feature/profile/data/model/user_model.dart';
import 'package:mzaodina_app/feature/profile/data/repo/user_data_repo.dart';
import 'package:mzaodina_app/core/helper/user_session.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.userDataRepo) : super(UserDataInitial());
  final UserDataRepo userDataRepo;

  Future<void> fetchUserData() async {
    emit(UserDataLoading());

    // التحقق من حالة تسجيل الدخول
    final isLoggedIn = await UserSession.isLoggedIn();
    if (!isLoggedIn) {
      emit(UserDataNotLoggedIn());
      return;
    }

    // لو المستخدم مسجل دخول، نجيب بياناته
    var result = await userDataRepo.profileUserData();
    result.fold(
      (failure) {
        debugPrint('Error fetching user data: ${failure.errMessage}');
        if (isClosed) return;

        emit(UserDataError(failure.errMessage));
      },
      (userData) {
        debugPrint('User data fetched successfully: ${userData.toString()}');
        if (isClosed) return;

        emit(UserDataSuccess(userData));
      },
    );
  }
}
