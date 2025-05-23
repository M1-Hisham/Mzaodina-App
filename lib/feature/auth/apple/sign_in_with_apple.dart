import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/feature/auth/apple/repo/apple_repo.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

Future<void> signInWithApple(context) async {
  try {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    // الحصول على البيانات
    final identityToken = credential.identityToken;
    // final authorizationCode = credential.authorizationCode;
    final userIdentifier = credential.userIdentifier;
    final name = credential.givenName;
    final email = credential.email;

    // إرسالهم للباك اند للتحقق أو التسجيل
    final appleRepo = AppleRepo(getIt<ApiService>());
    await appleRepo.appleLogin({
      "identityToken": identityToken,
      // "authorizationCode": authorizationCode,
      "userIdentifier": userIdentifier,
      "name": name,
      "email": email,
    });

    Navigator.pushReplacementNamed(context, AppRoutes.navBarRoute);
  } catch (e) {
    log('حدث خطأ أثناء تسجيل الدخول بـ Apple: $e');
  }
}
