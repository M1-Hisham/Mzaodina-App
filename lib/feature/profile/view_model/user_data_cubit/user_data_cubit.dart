import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mzaodina_app/feature/profile/data/model/user_model.dart';
import 'package:mzaodina_app/feature/profile/data/repo/user_data_repo.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.userDataRepo) : super(UserDataInitial());
  final UserDataRepo userDataRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(UserDataLoading());
    var result = await userDataRepo.profileUserData();
    result.fold(
      (failure) {
        debugPrint(failure.toString());
        emit(UserDataError(failure.errMessage));
      },
      (userData) {
        debugPrint(userData.toString());
        emit(UserDataSuccess(userData));
      },
    );
  }
}
