// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllNotificationModel _$GetAllNotificationModelFromJson(
  Map<String, dynamic> json,
) => GetAllNotificationModel(
  notifications: Notifications.fromJson(
    json['notifications'] as Map<String, dynamic>,
  ),
  unreadCount: (json['unread_count'] as num).toInt(),
);

Map<String, dynamic> _$GetAllNotificationModelToJson(
  GetAllNotificationModel instance,
) => <String, dynamic>{
  'notifications': instance.notifications.toJson(),
  'unread_count': instance.unreadCount,
};

Notifications _$NotificationsFromJson(Map<String, dynamic> json) =>
    Notifications(
      currentPage: (json['current_page'] as num).toInt(),
      data:
          (json['data'] as List<dynamic>)
              .map((e) => NotificationItem.fromJson(e as Map<String, dynamic>))
              .toList(),
      firstPageUrl: json['first_page_url'] as String,
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      lastPageUrl: json['last_page_url'] as String,
      links:
          (json['links'] as List<dynamic>)
              .map((e) => PaginationLink.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String,
      perPage: (json['per_page'] as num).toInt(),
      prevPageUrl: json['prev_page_url'] as String?,
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$NotificationsToJson(Notifications instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'links': instance.links.map((e) => e.toJson()).toList(),
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

NotificationItem _$NotificationItemFromJson(Map<String, dynamic> json) =>
    NotificationItem(
      id: json['id'] as String,
      type: json['type'] as String,
      notifiableType: json['notifiable_type'] as String,
      notifiableId: (json['notifiable_id'] as num).toInt(),
      data: NotificationData.fromJson(json['data'] as Map<String, dynamic>),
      readAt:
          json['read_at'] == null
              ? null
              : DateTime.parse(json['read_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$NotificationItemToJson(NotificationItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'notifiable_type': instance.notifiableType,
      'notifiable_id': instance.notifiableId,
      'data': instance.data.toJson(),
      'read_at': instance.readAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      actions:
          (json['actions'] as List<dynamic>)
              .map((e) => ActionData.fromJson(e as Map<String, dynamic>))
              .toList(),
      body: json['body'] as String,
      color: json['color'] as String,
      duration: json['duration'] as String,
      icon: json['icon'] as String,
      iconColor: json['iconColor'] as String?,
      status: json['status'] as String?,
      title: json['title'] as String,
      view: json['view'] as String,
      viewData: json['viewData'] as List<dynamic>,
      format: json['format'] as String,
    );

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      'actions': instance.actions.map((e) => e.toJson()).toList(),
      'body': instance.body,
      'color': instance.color,
      'duration': instance.duration,
      'icon': instance.icon,
      'iconColor': instance.iconColor,
      'status': instance.status,
      'title': instance.title,
      'view': instance.view,
      'viewData': instance.viewData,
      'format': instance.format,
    };

ActionData _$ActionDataFromJson(Map<String, dynamic> json) => ActionData(
  name: json['name'] as String,
  color: json['color'] as String?,
  event: json['event'] as String?,
  eventData: json['eventData'] as List<dynamic>,
  dispatchDirection: json['dispatchDirection'] as bool,
  dispatchToComponent: json['dispatchToComponent'] as String?,
  extraAttributes: json['extraAttributes'] as List<dynamic>,
  icon: json['icon'] as String?,
  iconPosition: json['iconPosition'] as String,
  iconSize: json['iconSize'] as String?,
  isOutlined: json['isOutlined'] as bool,
  isDisabled: json['isDisabled'] as bool,
  label: json['label'] as String,
  shouldClose: json['shouldClose'] as bool,
  shouldMarkAsRead: json['shouldMarkAsRead'] as bool,
  shouldMarkAsUnread: json['shouldMarkAsUnread'] as bool,
  shouldOpenUrlInNewTab: json['shouldOpenUrlInNewTab'] as bool,
  size: json['size'] as String,
  tooltip: json['tooltip'] as String?,
  url: json['url'] as String,
  view: json['view'] as String,
);

Map<String, dynamic> _$ActionDataToJson(ActionData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
      'event': instance.event,
      'eventData': instance.eventData,
      'dispatchDirection': instance.dispatchDirection,
      'dispatchToComponent': instance.dispatchToComponent,
      'extraAttributes': instance.extraAttributes,
      'icon': instance.icon,
      'iconPosition': instance.iconPosition,
      'iconSize': instance.iconSize,
      'isOutlined': instance.isOutlined,
      'isDisabled': instance.isDisabled,
      'label': instance.label,
      'shouldClose': instance.shouldClose,
      'shouldMarkAsRead': instance.shouldMarkAsRead,
      'shouldMarkAsUnread': instance.shouldMarkAsUnread,
      'shouldOpenUrlInNewTab': instance.shouldOpenUrlInNewTab,
      'size': instance.size,
      'tooltip': instance.tooltip,
      'url': instance.url,
      'view': instance.view,
    };

PaginationLink _$PaginationLinkFromJson(Map<String, dynamic> json) =>
    PaginationLink(
      url: json['url'] as String?,
      label: json['label'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$PaginationLinkToJson(PaginationLink instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
