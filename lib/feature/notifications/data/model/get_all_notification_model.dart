import 'package:json_annotation/json_annotation.dart';

part 'get_all_notification_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllNotificationModel {
  final Notifications notifications;
  @JsonKey(name: 'unread_count')
  final int unreadCount;

  GetAllNotificationModel({
    required this.notifications,
    required this.unreadCount,
  });

  factory GetAllNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllNotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllNotificationModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Notifications {
  @JsonKey(name: 'current_page')
  final int currentPage;
  final List<NotificationItem> data;
  @JsonKey(name: 'first_page_url')
  final String firstPageUrl;
  final int? from;
  @JsonKey(name: 'last_page')
  final int lastPage;
  @JsonKey(name: 'last_page_url')
  final String lastPageUrl;
  final List<PaginationLink> links;
  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;
  final String path;
  @JsonKey(name: 'per_page')
  final int perPage;
  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;
  final int? to;
  final int total;

  Notifications({
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

  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NotificationItem {
  final String id;
  final String type;
  @JsonKey(name: 'notifiable_type')
  final String notifiableType;
  @JsonKey(name: 'notifiable_id')
  final int notifiableId;
  final NotificationData data;
  @JsonKey(name: 'read_at')
  final DateTime? readAt;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  NotificationItem({
    required this.id,
    required this.type,
    required this.notifiableType,
    required this.notifiableId,
    required this.data,
    required this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NotificationData {
  final List<ActionData> actions;
  final String body;
  final String color;
  final String duration;
  final String icon;
  final String? iconColor;
  final String? status;
  final String title;
  final String view;
  final List<dynamic> viewData;
  final String format;

  NotificationData({
    required this.actions,
    required this.body,
    required this.color,
    required this.duration,
    required this.icon,
    required this.iconColor,
    required this.status,
    required this.title,
    required this.view,
    required this.viewData,
    required this.format,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ActionData {
  final String name;
  final String? color;
  final String? event;
  final List<dynamic> eventData;
  final bool dispatchDirection;
  final String? dispatchToComponent;
  final List<dynamic> extraAttributes;
  final String? icon;
  final String iconPosition;
  final String? iconSize;
  final bool isOutlined;
  final bool isDisabled;
  final String label;
  final bool shouldClose;
  final bool shouldMarkAsRead;
  final bool shouldMarkAsUnread;
  final bool shouldOpenUrlInNewTab;
  final String size;
  final String? tooltip;
  final String url;
  final String view;

  ActionData({
    required this.name,
    required this.color,
    required this.event,
    required this.eventData,
    required this.dispatchDirection,
    required this.dispatchToComponent,
    required this.extraAttributes,
    required this.icon,
    required this.iconPosition,
    required this.iconSize,
    required this.isOutlined,
    required this.isDisabled,
    required this.label,
    required this.shouldClose,
    required this.shouldMarkAsRead,
    required this.shouldMarkAsUnread,
    required this.shouldOpenUrlInNewTab,
    required this.size,
    required this.tooltip,
    required this.url,
    required this.view,
  });

  factory ActionData.fromJson(Map<String, dynamic> json) =>
      _$ActionDataFromJson(json);

  Map<String, dynamic> toJson() => _$ActionDataToJson(this);
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
