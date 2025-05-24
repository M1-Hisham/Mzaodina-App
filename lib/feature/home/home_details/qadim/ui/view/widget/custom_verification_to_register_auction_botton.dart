import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/helper/user_session.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_dialog_widget.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view/widget/auction_register_button.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view_model/cubit/show_action_cubit.dart';

class CustomVerificationToRegisterAuctionBotton extends StatelessWidget {
  final String slug;
  final ShowActionCubit showActionCubit;

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

          return BlocBuilder<ShowActionCubit, ShowActionState>(
            bloc: showActionCubit,
            buildWhen:
                (previous, current) =>
                    current is ShowActionSuccess ||
                    current is ShowActionError ||
                    current is ShowActionLoading,
            builder: (context, state) {
              if (state is ShowActionLoading) {
                return CustomElevatedButton(
                  text: '...جاري التحميل',
                  onPressed: () {},
                );
              } else if (state is ShowActionSuccess) {
                return AuctionRegisterButton(auction: state.showActionModel, );
              } else if (state is ShowActionError) {
                return CustomElevatedButton(
                  text: 'إعادة التحميل',
                  onPressed: () {
                    context.read<ShowActionCubit>().getShowAction(slug);
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
