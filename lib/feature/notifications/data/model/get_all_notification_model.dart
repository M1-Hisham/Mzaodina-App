import 'package:json_annotation/json_annotation.dart';

part 'get_all_notification_model.g.dart';

@JsonSerializable()
class GetAllNotificationModel {
  final bool status;
  final String message;
  final NotificationsData data;

  GetAllNotificationModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllNotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllNotificationModelToJson(this);
}

@JsonSerializable()
class NotificationsData {
  final NotificationPagination notifications;
  @JsonKey(name: "unread_count")
  final int unreadCount;

  NotificationsData({required this.notifications, required this.unreadCount});

  factory NotificationsData.fromJson(Map<String, dynamic> json) =>
      _$NotificationsDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsDataToJson(this);
}

@JsonSerializable()
class NotificationPagination {
  @JsonKey(name: "current_page")
  final int currentPage;
  final List<NotificationItem> data;
  @JsonKey(name: "first_page_url")
  final String? firstPageUrl;
  final int? from;
  @JsonKey(name: "last_page")
  final int lastPage;
  @JsonKey(name: "last_page_url")
  final String? lastPageUrl;
  final List<PaginationLink> links;
  @JsonKey(name: "next_page_url")
  final String? nextPageUrl;
  final String? path;
  @JsonKey(name: "per_page")
  final int perPage;
  @JsonKey(name: "prev_page_url")
  final String? prevPageUrl;
  final int? to;
  final int total;

  NotificationPagination({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory NotificationPagination.fromJson(Map<String, dynamic> json) =>
      _$NotificationPaginationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationPaginationToJson(this);
}

@JsonSerializable()
class NotificationItem {
  // يمكنك تحديث هذا الجزء لاحقًا بناءً على تفاصيل الإشعار الحقيقي
  const NotificationItem();

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationItemToJson(this);
}

@JsonSerializable()
class PaginationLink {
  final String? url;
  final String label;
  final bool active;

  PaginationLink({
    required this.url,
    required this.label,
    required this.active,
  });

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationLinkToJson(this);
}
