import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewJoinToAuctionScreen extends StatelessWidget {
  final String url;

  WebViewJoinToAuctionScreen({super.key, required this.url});

  final Dio dio = Dio();
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

              // onNavigationRequest: (NavigationRequest request) {
              //   log("🔁 محاولة التنقل إلى: ${request.url}");
              //   return NavigationDecision.navigate;
              // },
              onNavigationRequest: (NavigationRequest request) async {
                if (request.url.contains(
                  "/api/v1/auctions/subscribe/callback",
                )) {
                  final result = await _handleCallbackWithDartz(request.url);

                  result.fold(
                    (failureMessage) {
                      _showAuctionErrorDialog(context, failureMessage);
                    },
                    (data) async {
                      if (data['status'] == 'success') {
                        Navigator.pop(context);
                        await _showAuctionSuccessDialog(context);
                        // if (Navigator.canPop(context)) {
                        //   Navigator.pop(context);
                        //   await _showAuctionSuccessDialog(
                        //     context,
                        //   ); // ✅ استدعيه وانتظر ينتهي
                        // }
                      } else {
                        _showAuctionErrorDialog(
                          context,
                          data['message'] ?? 'حدث خطأ غير متوقع',
                        );
                      }
                    },
                  );

                  return NavigationDecision.prevent;
                }

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

  Future<Either<String, Map<String, dynamic>>> _handleCallbackWithDartz(
    String url,
  ) async {
    final Dio dio = Dio();

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        return right(response.data as Map<String, dynamic>);
      }
      return left('Invalid response format');
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError) as String);
    } catch (e) {
      return left(ServerFailure(e.toString()) as String);
    }
  }

  void _showAuctionErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: R.colors.whiteLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, color: Colors.red, size: 48),
                SizedBox(height: 12),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: R.textStyles.font18blackW500Light,
                ),
                SizedBox(height: 20),
                CustomElevatedButton(
                  text: 'إغلاق',
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
    );
  }

  Future<void> _showAuctionSuccessDialog(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => Builder(
            builder: (context2) {
              return AlertDialog(
                backgroundColor: R.colors.whiteLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'تم الاشتراك ',
                            style: R.textStyles.font22blackW500Light,
                          ),
                          TextSpan(
                            text: 'في المزاد ',
                            style: R.textStyles.font22blackW500Light.copyWith(
                              color: R.colors.primaryColorLight,
                            ),
                          ),
                          TextSpan(
                            text: 'بنجاح',
                            style: R.textStyles.font22blackW500Light,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    CustomElevatedButton(
                      text: 'إغلاق',
                      onPressed: () => Navigator.pop(context2),
                    ),
                  ],
                ),
              );
            },
          ),
    );
  }
}
