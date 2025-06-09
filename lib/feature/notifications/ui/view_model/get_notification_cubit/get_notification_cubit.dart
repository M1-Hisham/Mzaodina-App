import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/notifications/data/model/get_all_notification_model.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/get_notification_repo.dart';

part 'get_notification_state.dart';

class GetNotificationCubit extends Cubit<GetAllNotificationState> {
  final GetNotificationRepo repo;
  int currentPage = 1;
  int totalPages = 1;

  GetNotificationCubit(this.repo) : super(GetAllNotificationInitial());

  Future<void> fetchNotifications(int? page) async {
    emit(GetAllNotificationLoading());
    final result = await repo.getAllNotifications(page ?? currentPage);
    result.fold(
      (failure) => emit(GetAllNotificationFailure(failure.errMessage)),
      (data) {
        currentPage = page ?? currentPage;
        log('Current Page: $currentPage');
        totalPages = data.notifications.lastPage;
        log('Total Pages: $totalPages');
        emit(GetAllNotificationSuccess(data));
      },
    );
  }
}
