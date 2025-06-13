
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/notifications/data/model/mark_notification.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/mark_notifacation_repo.dart';

part 'mark_notification_state.dart';

class MarkNotificationCubit extends Cubit<MarkNotificationState> {
  MarkNotificationCubit(this.markRepo) : super(MarkNotificationInitial());

  final MarkNotifacationRepo markRepo;

  Future<void> markAllNotifications(List<String> allIds) async {
    emit(MarkNotificationLoading());

    final failureOrSuccess = await markRepo.markAllNotificatiom();

    failureOrSuccess.fold(
      (failure) => emit(MarkNotificationFailure(failure.errMessage)),
      (success) {
        emit(MarkNotificationSuccess(success));
      },
    );
  }

  Future<void> markSingleNotification({required String id}) async {
    emit(MarkNotificationLoading());

    final failureOrSuccess = await markRepo.markAsReadNotificatiom(id: id);

    failureOrSuccess.fold(
      (failure) => emit(MarkNotificationFailure(failure.errMessage)),
      (success) {
        emit(MarkNotificationSuccess(success));
      },
    );
  }
}
