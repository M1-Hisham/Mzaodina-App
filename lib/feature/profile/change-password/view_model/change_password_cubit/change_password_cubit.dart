import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/profile/change-password/data/model/change_password_model.dart';
import 'package:mzaodina_app/feature/profile/change-password/data/repo/change_password_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.changePasswordRepo) : super(ChangePasswordInitial());
  final ChangePasswordRepo changePasswordRepo;

  Future<void> changePassword(ChangePasswordModel model) async {
    emit(ChangePasswordLoading());
    final response = await changePasswordRepo.changePassword(model);

    response.fold(
      (failure) {
        emit(ChangePasswordFailure(failure.errMessage));
      },
      (success) {
        emit(ChangePasswordSuccess(success.data));
      },
    );
  }
}
