
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthState { login, register }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.login);

  void showLogin() => emit(AuthState.login);
  void showRegister() => emit(AuthState.register);
}