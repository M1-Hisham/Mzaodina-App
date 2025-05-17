import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthState { login, register, forgotPassword }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.login);
  // set form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void showLogin() => emit(AuthState.login);
  void showRegister() => emit(AuthState.register);
  void showForgotPassword() => emit(AuthState.forgotPassword);
}
