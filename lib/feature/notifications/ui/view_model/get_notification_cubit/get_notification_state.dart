part of 'get_notification_cubit.dart';

sealed class GetAllNotificationState {}

final class GetAllNotificationInitial extends GetAllNotificationState {}

class GetAllNotificationLoading extends GetAllNotificationState {}

final class GetAllNotificationSuccess extends GetAllNotificationState {
  final GetAllNotificationModel response;

  GetAllNotificationSuccess(this.response);
}

final class GetAllNotificationFailure extends GetAllNotificationState {
  final String error;

  GetAllNotificationFailure(this.error);
}
