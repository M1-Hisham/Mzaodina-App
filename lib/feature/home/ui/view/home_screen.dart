import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_app_bar_home.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_tap_view.dart';
import 'package:mzaodina_app/feature/profile/view_model/user_data_cubit/user_data_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Column(
        children: [
          BlocProvider(
            create: (context) => getIt<UserDataCubit>()..fetchUserData(),
            child: CustomAppBarHome(),
          ),
          // SizedBox(height: 20),
          Expanded(child: CustomTapView()),
        ],
      ),
    );
  }
}
