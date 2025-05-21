import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/data/repo/forgot_password_repo.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.changePasswordRepo) : super(ForgotPasswordInitial());

  final ForgotPasswordRepo changePasswordRepo;

  Future<void> forgotPassword(String email) async {
    emit(ForgotPasswordLoading());
    final response = await changePasswordRepo.forgotPassword(email);

    response.fold(
      (failure) {
        emit(ForgotPasswordFailure(failure.errMessage));
      },
      (success) {
        emit(ForgotPasswordSuccess(success.message));
      },
    );
  }
}
