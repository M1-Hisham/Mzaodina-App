import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/feature/auth/google/data/repo/google_repo.dart';
import 'package:mzaodina_app/feature/auth/google/view-model/google_cubit/google_cubit.dart';
import 'package:flutter/foundation.dart';


final GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: Platform.isIOS
      ? '412322100407-a58r9tpblb2dp6l0at9scou4nm6jv6mm.apps.googleusercontent.com'
      : kReleaseMode
          ? '412322100407-t0cdnq7vjc4kdsb1u06d3ieii2g0gkas.apps.googleusercontent.com'
          : '412322100407-c19h7leo0nkb57frbp5v5o343gq9c0n1.apps.googleusercontent.com',
  scopes: ['email', 'profile'],
);

Future<void> loginWithGoogle(context) async {
  try {
    log('🔑 Attempting to sign in with Google...');
        log('🆔 Google Client ID in use: ${_googleSignIn.clientId}');

    // Force sign out first to allow selecting a different account
    await _googleSignIn.signOut();
    if (_googleSignIn.currentUser != null) {
      log('🔑 User is already signed in: ${_googleSignIn.currentUser!.email}');
      return;
    }

    final googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      log('تم إلغاء تسجيل الدخول من قبل المستخدم');
      return;
    }
    log('تم تسجيل الدخول بنجاح: ${googleUser.email}');
    final googleAuth = await googleUser.authentication;
    if (googleAuth.idToken == null) {
      log('Failed to get ID token from Google authentication');
      return;
    }
    log('🔑 Google ID Token: ${googleAuth.idToken}');

    final idToken = googleAuth.idToken;
    // final accessToken = googleAuth.accessToken;
    // final email = googleUser.email;
    // final name = googleUser.displayName;

    log('ID Token: $idToken');
    // log('Access Token: $accessToken');

    final googleCubit = GoogleCubit(GoogleRepo(getIt<ApiService>()));
    log('🔑 GoogleCubit created');
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
    log('🔑 Calling login method on GoogleCubit');
    await googleCubit.login({"token": idToken});
    log('🔑 Login method called successfully');
    Navigator.of(context).pop(); // Close the loading dialog
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.navBarRoute,
      (Route<dynamic> route) => false,
    );
    log('تم تسجيل الدخول بنجاح');
  } catch (e, s) {
    log("❌ Exception: $e", stackTrace: s);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('حدث خطأ أثناء تسجيل الدخول. يرجى المحاولة مرة أخرى. Exception: $e"'),
      ),
    );
  }
}
