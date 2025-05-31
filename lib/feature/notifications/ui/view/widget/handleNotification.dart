import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/feature/notifications/data/repo/mark_notifacation_repo.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';

/// Handles notification payload and routes to appropriate screen
void handleNotification(BuildContext context, Map<String, dynamic> data) {
  try {
    log('📱 Handling notification with data: $data');

    // Extract notification type and ID
    final type = data['type']?.toString().toLowerCase();
    final id = data['id']?.toString();
    final route = data['route']?.toString();

    // Mark notification as read if ID is provided
    if (id != null) {
      _markNotificationAsRead(id);
    }

    // Handle routing based on notification type and route
    if (route != null) {
      _handleRoute(context, route, data);
    } else if (type != null) {
      _handleTypeBasedRouting(context, type, data);
    } else {
      log('⚠️ No route or type specified in notification data');
    }
  } catch (e) {
    log('❌ Error handling notification: $e');
  }
}

/// Mark notification as read
Future<void> _markNotificationAsRead(String id) async {
  try {
    final repo = getIt<MarkNotifacationRepo>();
    await repo.markAsReadNotificatiom(id: id);
    log('✅ Notification marked as read: $id');
  } catch (e) {
    log('❌ Error marking notification as read: $e');
  }
}

/// Handle routing based on route parameter
void _handleRoute(
  BuildContext context,
  String route,
  Map<String, dynamic> data,
) {
  switch (route.toLowerCase()) {
    case '/home_details_qadim':
      final slug = data['slug'];
      if (slug != null) {
        Navigator.pushNamed(
          context,
          AppRoutes.homeDetailsQadimScreenRoute,
          arguments: {'slug': slug},
        );
      }
      break;

    case '/home_details_muntahi':
      final slug = data['slug'];
      if (slug != null) {
        Navigator.pushNamed(
          context,
          AppRoutes.homeDetailsMuntahiScreenRoute,
          arguments: {'slug': slug},
        );
      }
      break;

    case '/home_details_jaraa':
      final slug = data['slug'];
      if (slug != null) {
        Navigator.pushNamed(
          context,
          AppRoutes.homeDetailsJaraaScreenRoute,
          arguments: {'slug': slug},
        );
      }
      break;

    case '/home_details_sayantaliq':
      final slug = data['slug'];
      if (slug != null) {
        Navigator.pushNamed(
          context,
          AppRoutes.homeDetailsSayantaliqScreenRoute,
          arguments: {'slug': slug},
        );
      }
      break;

    case '/notifications':
      Navigator.pushNamed(context, AppRoutes.notificationsScreenRoute);
      break;

    case '/profile':
      Navigator.pushNamed(context, AppRoutes.profileRoute);
      break;

    case '/invoice_details':
      Navigator.pushNamed(context, AppRoutes.invoiceDetailsScreenRoute);
      break;

    default:
      log('⚠️ Unknown route: $route');
      // Navigate to home as fallback
      Navigator.pushNamed(context, AppRoutes.homeRoute);
  }
}

/// Handle routing based on notification type
void _handleTypeBasedRouting(
  BuildContext context,
  String type,
  Map<String, dynamic> data,
) {
  switch (type) {
    case 'auction':
      final slug = data['slug'];
      if (slug != null) {
        // Determine which auction type it is and route accordingly
        final auctionType = data['auction_type']?.toString().toLowerCase();
        switch (auctionType) {
          case 'qadim':
            Navigator.pushNamed(
              context,
              AppRoutes.homeDetailsQadimScreenRoute,
              arguments: {'slug': slug},
            );
            break;
          case 'muntahi':
            Navigator.pushNamed(
              context,
              AppRoutes.homeDetailsMuntahiScreenRoute,
              arguments: {'slug': slug},
            );
            break;
          case 'jaraa':
            Navigator.pushNamed(
              context,
              AppRoutes.homeDetailsJaraaScreenRoute,
              arguments: {'slug': slug},
            );
            break;
          case 'sayantaliq':
            Navigator.pushNamed(
              context,
              AppRoutes.homeDetailsSayantaliqScreenRoute,
              arguments: {'slug': slug},
            );
            break;
          default:
            Navigator.pushNamed(context, AppRoutes.homeRoute);
        }
      }
      break;

    case 'invoice':
      Navigator.pushNamed(context, AppRoutes.invoiceDetailsScreenRoute);
      break;

    case 'system':
      Navigator.pushNamed(context, AppRoutes.notificationsScreenRoute);
      break;

    default:
      log('⚠️ Unknown notification type: $type');
      // Navigate to home as fallback
      Navigator.pushNamed(context, AppRoutes.homeRoute);
  }
}
