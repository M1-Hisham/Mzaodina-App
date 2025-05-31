import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          // ✅ أضفنا NavigationDelegate هنا
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (url) {
                log("⏳ بدأ تحميل الصفحة: $url");
              },
              onPageFinished: (url) {
                log("✅ تم تحميل الصفحة: $url");
              },
              onWebResourceError: (error) {
                log("❌ حصل خطأ في الويب: ${error.description}");
              },
              onNavigationRequest: (NavigationRequest request) {
                log("🔁 محاولة التنقل إلى: ${request.url}");
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(title: const Text('صفحة الدفع')),
      body: WebViewWidget(controller: controller),
    );
  }
}
