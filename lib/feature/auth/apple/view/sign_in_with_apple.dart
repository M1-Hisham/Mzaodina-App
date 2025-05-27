import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/feature/auth/apple/data/repo/apple_repo.dart';
import 'package:mzaodina_app/feature/auth/apple/view-model/apple_cubit/apple_cubit.dart';
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

    log('تم تسجيل الدخول بنجاح بـ Apple:');
    log('token: $identityToken');
    log('user_id: $userIdentifier');
    log('name: $name');
    log('email: $email');

    final appleCubit = AppleCubit(AppleRepo(getIt<ApiService>()));
    await appleCubit.login({
      "token": identityToken,
      // "authorizationCode": authorizationCode,
      "user_id": userIdentifier,
      "name": name,
      // "email": email,
    });

    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.navBarRoute,
      (Route<dynamic> route) => false,
    );
  } catch (e) {
    log('حدث خطأ أثناء تسجيل الدخول بـ Apple: $e');
  }
}
