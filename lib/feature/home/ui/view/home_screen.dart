import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/ongoing_cubit/ongoing_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/ui/view_model/finished_cubit/finished_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/notstart_cubit/notstart_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view_model/ready_cubit/ready_cubit.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_app_bar_home.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_tap_view.dart';
import 'package:mzaodina_app/feature/home/ui/view_model/actions-count-cubit/actions_count_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/user_data_cubit/user_data_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Column(
        children: [
          BlocProvider.value(
            value: getIt<UserDataCubit>()..fetchUserData(),
            child: CustomAppBarHome(),
          ),
          // SizedBox(height: 20),
          Expanded(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context) =>
                          getIt<NotstartCubit>()..getNotStartAuctions(),
                ),

                BlocProvider(
                  create: (context) => getIt<ReadyCubit>()..getReadyAuctions(),
                ),
                BlocProvider(
                  create:
                      (context) => getIt<OngoingCubit>()..getOngoingAuctions(),
                ),
                BlocProvider(
                  create:
                      (context) =>
                          getIt<FinishedCubit>()..getFinishedAuctions(),
                ),
                BlocProvider(
                  create:
                      (context) =>
                          getIt<ActionsCountCubit>()..fetchActionsCount(),
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
