import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/feature/auth/google/data/repo/google_repo.dart';
import 'package:mzaodina_app/feature/auth/google/view-model/google_cubit/google_cubit.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId:
      Platform.isIOS
          ? '412322100407-a58r9tpblb2dp6l0at9scou4nm6jv6mm.apps.googleusercontent.com'
          : null,
  scopes: ['email', 'profile'],
);

Future<void> loginWithGoogle(context) async {
  try {
    final googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      log('تم إلغاء تسجيل الدخول من قبل المستخدم');
      return;
    }

    final googleAuth = await googleUser.authentication;

    final idToken = googleAuth.idToken;
    // final accessToken = googleAuth.accessToken;
    // final email = googleUser.email;
    // final name = googleUser.displayName;

    log('ID Token: $idToken');
    // log('Access Token: $accessToken');

    final googleCubit = GoogleCubit(GoogleRepo(getIt<ApiService>()));
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text('جاري تسجيل الدخول...'),
            ],
          ),
        );
      },
    );
    await googleCubit.login({"token": idToken});
    Navigator.of(context).pop(); // Close the loading dialog
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.navBarRoute,
      (Route<dynamic> route) => false,
    );
    log('تم تسجيل الدخول بنجاح');
  } catch (e) {
    log("خطأ أثناء تسجيل الدخول: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('حدث خطأ أثناء تسجيل الدخول. يرجى المحاولة مرة أخرى.'),
      ),
    );
  }
}
