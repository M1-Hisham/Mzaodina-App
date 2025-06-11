import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/notifications/data/model/get_all_notification_model.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/get_notification_repo.dart';

part 'get_notification_state.dart';

class GetNotificationCubit extends Cubit<GetAllNotificationState> {
  final GetNotificationRepo repo;
  int currentPage = 1;
  int totalPages = 1;
  bool isLoadingMore = false;

  GetNotificationCubit(this.repo) : super(GetAllNotificationInitial());

  Future<void> fetchNotifications(int page, {bool append = false}) async {
    if (append) {
      isLoadingMore = true;
    } else {
      emit(GetAllNotificationLoading());
    }

    final result = await repo.getAllNotifications(page);
    result.fold(
      (failure) {
        isLoadingMore = false;
        emit(GetAllNotificationFailure(failure.errMessage));
      },
      (data) {
        currentPage = page;
        totalPages = data.notifications.lastPage;

        if (append && state is GetAllNotificationSuccess) {
          final oldData = (state as GetAllNotificationSuccess)
              .response
              .notifications
              .data;

          final newData = [...oldData, ...data.notifications.data];

          final mergedData = data.copyWith(
            notifications: data.notifications.copyWith(data: newData),
          );

          emit(GetAllNotificationSuccess(mergedData));
        } else {
          emit(GetAllNotificationSuccess(data));
        }

        isLoadingMore = false;

        log('Current Page: $currentPage');
        log('Total Pages: $totalPages');
      },
    );
  }
}
