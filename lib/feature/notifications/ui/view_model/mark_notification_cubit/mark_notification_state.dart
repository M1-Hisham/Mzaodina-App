part of 'mark_notification_cubit.dart';

sealed class MarkNotificationState {}

final class MarkNotificationInitial extends MarkNotificationState {}
class MarkNotificationLoading extends MarkNotificationState {}

class MarkNotificationSuccess extends MarkNotificationState {
  final MarkNotificationModel data;

  MarkNotificationSuccess(this.data);
}

class MarkNotificationFailure extends MarkNotificationState {
  final String error;

  MarkNotificationFailure(this.error);
}