import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/router/route.dart';

void handleNotification(BuildContext context, Map<String, dynamic> data) {
  final route = data['route'];
  final id = data['id'];

  if (route == '/product_details') {
    Navigator.pushNamed(context, AppRoutes.homeRoute);
  } else if (route == '/notifications') {
    Navigator.pushNamed(context, '/notifications');
  } else {
    // fallback or log
    print("🚫 لا يوجد توجيه معروف لهذا الإشعار");
  }
}
