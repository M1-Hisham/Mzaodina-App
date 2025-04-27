import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/helper/spacing.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/auth/login/view/login_form_screen.dart';
import 'package:mzaodina_app/feature/auth/register/view/register_form_screen.dart';
import 'package:mzaodina_app/feature/auth/ui/view-model/cubit/auth_cubit_cubit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: R.colors.primaryColorLight,
        resizeToAvoidBottomInset: true,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Spacer(),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return Column(
                            children: [_buildHeader(context), spacingV(20)],
                          );
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: R.colors.whiteLight,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  spacingV(20),
                                  _toggleButtons(
                                    context.read<AuthCubit>(),
                                    context.watch<AuthCubit>().state,
                                  ),
                                  spacingV(20),
                                  if (state == AuthState.login)
                                    LoginFormScreen(),
                                  if (state == AuthState.register)
                                    RegisterFormScreen(),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state == AuthState.login) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "   \"اهلا بكم\nفي مزاودين",
                style: R.textStyles.font34WhiteW500Light,
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _toggleButtons(cubit, state) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFE9EEFC),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: cubit.showLogin,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color:
                      state == AuthState.login
                          ? R.colors.black
                          : R.colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    color:
                        state == AuthState.login
                            ? R.colors.whiteLight
                            : R.colors.black,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: cubit.showRegister,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color:
                      state == AuthState.register
                          ? R.colors.black
                          : R.colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: Text(
                  'انشاء حساب',
                  style: TextStyle(
                    color:
                        state == AuthState.register
                            ? R.colors.whiteLight
                            : R.colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
