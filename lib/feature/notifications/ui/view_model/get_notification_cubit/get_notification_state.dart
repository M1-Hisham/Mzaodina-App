part of 'get_notification_cubit.dart';

sealed class GetNotificationState {}

final class GetNotificationInitial extends GetNotificationState {}

class NotificationLoading extends GetNotificationState {}

final class NotificationSuccess extends GetNotificationState {
  final GetAllNotificationModel response;

  NotificationSuccess(this.response);
}

final class NotificationFailure extends GetNotificationState {
  final String error;

  NotificationFailure(this.error);
}
