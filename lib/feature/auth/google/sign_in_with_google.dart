import 'dart:convert';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:mzaodina_app/core/router/app_routes.dart';

Future<void> signInWithGoogle(context) async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      // Optional clientId
      clientId: 'your-client_id.apps.googleusercontent.com',
      scopes: ['email'],
    );

    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      log('❌ تسجيل الدخول ملغي من المستخدم');
      return;
    }

    final googleAuth = await googleUser.authentication;

    final idToken = googleAuth.idToken;

    if (idToken == null) {
      log('❌ لم يتم الحصول على ID Token');
      return;
    }

    // إرسال التوكن للباك اند
    await sendToBackend(idToken);
    log('✅ تسجيل الدخول ناجح: $idToken');
    Navigator.pushReplacementNamed(context, AppRoutes.navBarRoute);
  } catch (e) {
    log('❌ خطأ أثناء تسجيل الدخول: $e');
  }
}

Future<void> sendToBackend(String idToken) async {
  const backendUrl = 'https://your-backend.com/api/google-login';

  final response = await http.post(
    Uri.parse(backendUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'provider': 'google', 'token': idToken}),
  );

  if (response.statusCode == 200) {
    log('✅ تسجيل الدخول ناجح');
  } else {
    log('❌ فشل تسجيل الدخول: ${response.body}');
  }
}
