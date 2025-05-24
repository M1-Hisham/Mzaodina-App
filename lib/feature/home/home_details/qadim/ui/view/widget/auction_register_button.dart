import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/feature/home/home_details/data/model/show_action_model.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view_model/register_to_auction_cubit/register_to_auction_cubit.dart';

class AuctionRegisterButton extends StatelessWidget {
  final ShowAuctionModel auction;

  const AuctionRegisterButton({super.key, required this.auction});

  @override
  Widget build(BuildContext context) {
    final auctionData = auction.data;

    return BlocBuilder<RegisterToAuctionCubit, RegisterToAuctionState>(
      builder: (context, registerState) {
        if (auctionData.type == 'joinable') {
          return CustomElevatedButton(
            text: 'الانضمام الى المزاد',
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.joinTheAuction);
            },
          );
        }

        if (auctionData.type == 'registerable') {
          if (registerState is RegisterToAuctionLoading) {
            return CustomElevatedButton(
              text: 'جاري التسجيل...',
              onPressed: () {},
            );
          }

          if (auctionData.isRegister == false) {
            return CustomElevatedButton(
              text: 'التسجيل في المزاد',
              onPressed: () {
                context.read<RegisterToAuctionCubit>().registerToAuction(
                  auctionData.slug,
                );
              },
            );
          }

          return CustomElevatedButton(
            textDirection: TextDirection.rtl,
            icon: SvgPicture.asset(R.images.tureImageGreen),
            text: 'تم التسجيل فى المزاد',
            textStyle: R.textStyles.font14whiteW500Light.copyWith(
              color: R.colors.greenColor,
            ),
            backgroundColor: R.colors.colorUnSelected,
            onPressed: () {},
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
