import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/qadim_show_action_model.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/register_to_auction_cubit/register_to_auction_cubit.dart';

class AuctionRegisterButton extends StatelessWidget {
  final QadimShowAuctionModel auction;
  final VoidCallback? onRegistered; // Callback to refresh parent

  const AuctionRegisterButton({
    super.key,
    required this.auction,
    this.onRegistered,
  });

  @override
  Widget build(BuildContext context) {
    final auctionData = auction.data;

    return BlocConsumer<RegisterToAuctionCubit, RegisterToAuctionState>(
      listener: (context, state) {
        if (state is RegisterToAuctionSuccess) {
          // Show message from data
          final message = state.registerToAutionModel.message;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
          // Refresh auction data
          if (onRegistered != null) onRegistered!();
        } else if (state is RegisterToAuctionError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, registerState) {
        if (auctionData.type == 'joinable') {
          return CustomElevatedButton(
            text:
                auctionData.auctionStartRate == 100
                    ? 'اكتمل المزاد'
                    : 'الانضمام الى المزاد',
            onPressed:
                auctionData.auctionStartRate == 100
                    ? () {}
                    : () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.joinTheAuction,
                        arguments: {
                          'openingAmount': auctionData.openingAmount.toDouble(),
                          'registrationAmount':
                              auctionData.registrationAmount.toDouble(),
                          'requiredBidders': auctionData.requiredBidders,
                          'auctionId': auctionData.id,
                          'slug': auctionData.slug,
                        },
                      );
                    },
          );
        }
        if (auctionData.isRegister == false &&
            auctionData.type == 'registerable') {
          final isLoading = registerState is RegisterToAuctionLoading;
          return CustomElevatedButton(
            text: isLoading ? 'جاري التسجيل...' : 'التسجيل في المزاد',
            onPressed:
                isLoading
                    ? () {}
                    : () {
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
      },
    );
  }
}
