// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllNotificationModel _$GetAllNotificationModelFromJson(
  Map<String, dynamic> json,
) => GetAllNotificationModel(
  status: json['status'] as bool,
  message: json['message'] as String,
  data: NotificationsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetAllNotificationModelToJson(
  GetAllNotificationModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

NotificationsData _$NotificationsDataFromJson(Map<String, dynamic> json) =>
    NotificationsData(
      notifications: NotificationPagination.fromJson(
        json['notifications'] as Map<String, dynamic>,
      ),
      unreadCount: (json['unread_count'] as num).toInt(),
    );

Map<String, dynamic> _$NotificationsDataToJson(NotificationsData instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
      'unread_count': instance.unreadCount,
    };

NotificationPagination _$NotificationPaginationFromJson(
  Map<String, dynamic> json,
) => NotificationPagination(
  currentPage: (json['current_page'] as num).toInt(),
  data:
      (json['data'] as List<dynamic>)
          .map((e) => NotificationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
  firstPageUrl: json['first_page_url'] as String?,
  from: (json['from'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num).toInt(),
  lastPageUrl: json['last_page_url'] as String?,
  links:
      (json['links'] as List<dynamic>)
          .map((e) => PaginationLink.fromJson(e as Map<String, dynamic>))
          .toList(),
  nextPageUrl: json['next_page_url'] as String?,
  path: json['path'] as String?,
  perPage: (json['per_page'] as num).toInt(),
  prevPageUrl: json['prev_page_url'] as String?,
  to: (json['to'] as num?)?.toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$NotificationPaginationToJson(
  NotificationPagination instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'data': instance.data,
  'first_page_url': instance.firstPageUrl,
  'from': instance.from,
  'last_page': instance.lastPage,
  'last_page_url': instance.lastPageUrl,
  'links': instance.links,
  'next_page_url': instance.nextPageUrl,
  'path': instance.path,
  'per_page': instance.perPage,
  'prev_page_url': instance.prevPageUrl,
  'to': instance.to,
  'total': instance.total,
};

NotificationItem _$NotificationItemFromJson(Map<String, dynamic> json) =>
    NotificationItem();

Map<String, dynamic> _$NotificationItemToJson(NotificationItem instance) =>
    <String, dynamic>{};

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
