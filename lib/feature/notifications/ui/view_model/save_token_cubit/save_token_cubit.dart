import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/notifications/data/model/save_token_responce_model.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/notification_repo.dart';

part 'save_token_state.dart';

class SaveTokenCubit extends Cubit<SaveTokenState> {
  SaveTokenCubit(this.notificationRepo) : super(SaveTokenInitial());
  final NotificationRepo notificationRepo;
  Future<void> sendFcmToken(String token) async {
    if (isClosed) return;

    emit(SaveTokenLoading());

    final result = await notificationRepo.saveFcmToken(token: token);

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) emit(SaveTokenFailure(failure.errMessage));
      },
      (response) {
        if (!isClosed) emit(SaveTokenSuccess(response));
      },
    );
  }
}
