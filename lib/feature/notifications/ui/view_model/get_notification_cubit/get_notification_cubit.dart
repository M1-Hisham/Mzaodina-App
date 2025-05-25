import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/notifications/data/model/get_all_notification_model.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/get_notification_repo.dart';

part 'get_notification_state.dart';

class GetNotificationCubit extends Cubit<GetAllNotificationState> {
  GetNotificationCubit(this.notificationRepo)
    : super(GetAllNotificationInitial());
  final GetNotificationRepo notificationRepo;

  Future<void> fetchNotifications() async {
    log('Fetching notifications...');
    emit(GetAllNotificationLoading());

    final result = await notificationRepo.getAllNotifications();

    result.fold(
      (failure) {
        log('Error fetching notifications: ${failure.errMessage}');
        emit(GetAllNotificationFailure(failure.errMessage));
      },
      (response) {
        log(
          'Notifications fetched successfully: ${response.notifications.data.length}',
        );
        // هنا يمكنك التعامل مع البيانات المسترجعة
        emit(GetAllNotificationSuccess(response));
      },
    );
  }
}
