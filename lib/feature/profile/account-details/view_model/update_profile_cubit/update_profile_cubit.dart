import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/feature/profile/account-details/data/model/update_profile_body.dart';
import 'package:mzaodina_app/feature/profile/account-details/data/repo/update_profile_repo.dart';
import 'package:mzaodina_app/feature/profile/data/model/user_model.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this.updateProfileRepo) : super(UpdateProfileInitial());
  final UpdateProfileRepo updateProfileRepo;

  Future<void> updateUserData(UpdateProfileBody updateProfileBody) async {
    emit(UpdateProfileLoading());

    var result = await updateProfileRepo.profileUpdate(updateProfileBody);
    result.fold(
      (failure) {
        log('Error fetching user data: ${failure.errMessage}');
        if (isClosed) return;
        emit(UpdateProfileError(failure.errMessage, failure: failure));
      },
      (userData) {
        log('User data fetched successfully: ${userData.toString()}');
        emit(UpdateProfileSuccess(userData));
      },
    );
  }
}
