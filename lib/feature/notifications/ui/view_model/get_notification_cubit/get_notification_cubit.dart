import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/notifications/data/model/get_all_notification_model.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/get_notification_repo.dart';

part 'get_notification_state.dart';

class GetNotificationCubit extends Cubit<GetNotificationState> {
  GetNotificationCubit(this.notificationRepo) : super(GetNotificationInitial());
  final GetNotificationRepo notificationRepo;

  Future<void> fetchNotifications() async {
    emit(NotificationLoading());

    final result = await notificationRepo.getNotifications();

    result.fold(
      (failure) => emit(NotificationFailure(failure.errMessage)),
      (response) => emit(NotificationSuccess(response)),
    );
  }
}
