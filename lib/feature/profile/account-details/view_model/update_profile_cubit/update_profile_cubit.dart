import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mzaodina_app/feature/profile/account-details/data/model/update_profile_body.dart';
import 'package:mzaodina_app/feature/profile/account-details/data/repo/update_profile_repo.dart';
import 'package:mzaodina_app/feature/profile/data/model/user_model.dart';
import 'package:mzaodina_app/core/helper/user_session.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this.userDataRepo) : super(UserDataInitial());
  final UpdateProfileRepo userDataRepo;

  Future<void> fetchUserData(UpdateProfileBody updateProfileBody,) async {
    emit(UserDataLoading());

    // التحقق من حالة تسجيل الدخول
    final isLoggedIn = await UserSession.isLoggedIn();
    if (!isLoggedIn) {
      emit(UserDataNotLoggedIn());
      return;
    }

    // لو المستخدم مسجل دخول، نجيب بياناته
    var result = await userDataRepo.profileUpdate( updateProfileBody,);
    result.fold(
      (failure) {
        debugPrint('Error fetching user data: ${failure.errMessage}');
        emit(UserDataError(failure.errMessage));
      },
      (userData) {
        debugPrint('User data fetched successfully: ${userData.toString()}');
        emit(UserDataSuccess(userData));
      },
    );
  }
}
