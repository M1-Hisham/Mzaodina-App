import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/ui/view_model/jaraa_cubit/jaraa_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/muntahi/ui/view_model/muntahi_cubit/muntahi_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view_model/qadim_cubit/qadim_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/ui/view_model/sayantaliq_cubit/sayantaliq_cubit.dart';
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
          Expanded(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context) => getIt<QadimCubit>()..getNotStartAuctions(),
                ),
                BlocProvider(
                  create:
                      (context) => getIt<SayantaliqCubit>()..getReadyAuctions(),
                ),
                BlocProvider(
                  create:
                      (context) => getIt<JaraaCubit>()..getOngoingAuctions(),
                ),
                BlocProvider(
                  create:
                      (context) => getIt<MuntahiCubit>()..getFinishedAuctions(),
                ),
              ],
              child: CustomTapView(),
            ),
          ),
        ],
      ),
    );
  }
}
