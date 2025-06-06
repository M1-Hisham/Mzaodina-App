import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/helper/user_session.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_dialog_widget.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view/widget/auction_register_button.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/register_to_auction_cubit/register_to_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/qadim_show_auction_cubit/qadim_show_action_cubit.dart';

class CustomVerificationToRegisterAuctionBotton extends StatelessWidget {
  final String slug;
  final NotstartShowActionCubit showActionCubit;

  const CustomVerificationToRegisterAuctionBotton({
    super.key,
    required this.slug,
    required this.showActionCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
      child: FutureBuilder<bool>(
        future: UserSession.isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CustomElevatedButton(
              text: '...جاري التحقق من تسجيل الدخول',
              onPressed: () {},
            );
          }

          final isLoggedIn = snapshot.data ?? false;

          if (!isLoggedIn) {
            return CustomElevatedButton(
              text: 'التسجيل في المزاد',

              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (BuildContext context) => CustomDialogWidget(
                        buttonText: 'تسجيل الدخول',
                        message: 'يجب تسجيل الدخول أولاً للمشاركة في المزاد',

                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, AppRoutes.authRouter);
                        },
                      ),
                );
              },
            );
          }

          return BlocBuilder<NotstartShowActionCubit, NotstartShowActionState>(
            bloc: showActionCubit,
            buildWhen:
                (previous, current) =>
                    current is NotstartShowActionSuccess ||
                    current is NotstartShowActionError ||
                    current is NotstartShowActionLoading,
            builder: (context, state) {
              if (state is NotstartShowActionLoading) {
                return CustomElevatedButton(
                  text: '...جاري التحميل',
                  onPressed: () {},
                );
              } else if (state is NotstartShowActionSuccess) {
                return BlocProvider<RegisterToAuctionCubit>(
                  create: (context) => getIt<RegisterToAuctionCubit>(),
                  child: AuctionRegisterButton(
                    auction: state.showActionModel,
                    onRegistered: () {
                      context.read<NotstartShowActionCubit>().getShowAction(
                        slug,
                      );
                    },
                  ),
                );
              } else if (state is NotstartShowActionError) {
                return CustomElevatedButton(
                  text: 'إعادة التحميل',
                  onPressed: () {
                    context.read<NotstartShowActionCubit>().getShowAction(slug);
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
