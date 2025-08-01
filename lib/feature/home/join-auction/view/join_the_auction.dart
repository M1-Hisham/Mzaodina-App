import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/check-box/view/custom_check_box.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/subscribe_auction-cubit/subscribe_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/join-auction/view/web_view_join_to_auction_screen.dart';
import 'package:mzaodina_app/feature/home/join-auction/view/widgets/counter_view.dart';
import 'package:mzaodina_app/feature/profile/terms&conditions/view/terms_and_conditions_screen.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';
import 'package:mzaodina_app/feature/profile/view_model/terms_cubit/terms_cubit.dart';

class JoinTheAuction extends StatelessWidget {
  final double openingAmount;
  final double registrationAmount;
  final int requiredBidders;
  final int auctionId;
  final double auctionStartRate;
  final int currentBidders;
  final String slug;

  const JoinTheAuction({
    super.key,
    required this.openingAmount,
    required this.registrationAmount,
    required this.requiredBidders,
    required this.auctionId,
    required this.slug,
    required this.auctionStartRate,
    required this.currentBidders,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubscribeAuctionCubit, SubscribeToAuctionState>(
      listener: (context, state) {
        if (state is SubscribeAuctionError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is SubscribeAuctionSuccess) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => WebViewJoinToAuctionScreen(
                    url: state.subscribeToAutionModel.url,
                  ),
            ),
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const CustomAppBarAccount(title: 'الرسوم التنظيمية'),
                CoustomRowItem(
                  title: 'الرسوم التنظيمية',
                  price: registrationAmount.toStringAsFixed(2),
                ),
                CounterView(
                  auctionId: auctionId,
                  requiredBidders: requiredBidders,
                  openingAmount: openingAmount,
                  registrationAmount: registrationAmount,
                  auctionStartRate: auctionStartRate,
                  currentBidders: currentBidders,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WarningCheckbox extends StatelessWidget {
  const WarningCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckbox(),
        Expanded(
          child: Text(
            'تنبيه : الرسوم تساعدنا فى تنظيم المزاد وضمان الجدية بين المشاركين. نعتذر لايمكن استردادها',
            style: R.textStyles.font14Grey400Light.copyWith(
              color: const Color(0xFFF32828),
            ),
          ),
        ),
      ],
    );
  }
}

class TermsAndConditionsCheckbox extends StatelessWidget {
  const TermsAndConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckbox(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => BlocProvider(
                      create: (context) =>getIt<TermsCubit>()..getTerms(),
                      child: const TermsAndConditionsScreen(),
                    ),
              ),
            );
          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Text.rich(
              TextSpan(
                text: 'الموافقة علي ',
                style: R.textStyles.font12Grey3W500Light,
                children: [
                  TextSpan(
                    text: 'الشروط والاحكام',
                    style: R.textStyles.font12primaryW600Light,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
