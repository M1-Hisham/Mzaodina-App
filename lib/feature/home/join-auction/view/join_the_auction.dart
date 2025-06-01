import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/check-box/view-model/check_box_cubit.dart';
import 'package:mzaodina_app/core/widgets/check-box/view/custom_check_box.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/model/subscribe_aution_body.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view_model/subscribe_auction-cubit/subscribe_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/join-auction/view/web_view_screen.dart';
import 'package:mzaodina_app/feature/home/join-auction/view/widgets/counter_view.dart';
import 'package:mzaodina_app/feature/profile/terms&conditions/view/terms_and_conditions_screen.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';

class JoinTheAuction extends StatelessWidget {
  final double openingAmount;
  final double registrationAmount;
  final int requiredBidders;
  final int auctionId;

  const JoinTheAuction({
    super.key,
    required this.openingAmount,
    required this.registrationAmount,
    required this.requiredBidders,
    required this.auctionId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubscribeAuctionCubit, SubscribeToAuctionState>(
      listener: (context, state) {
        if (state is SubscribeAuctionError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is SubscribeAuctionSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => WebViewScreen(url: state.subscribeToAutionModel.url),
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
                  price: '$registrationAmount',
                ),
                CounterView(
                  auctionId: auctionId,
                  requiredBidders: requiredBidders,
                  openingAmount: openingAmount,
                  registrationAmount: registrationAmount,
                ),

                const SizedBox(height: 25),
                WarningCheckbox(),
                TermsAndConditionsCheckbox(),
                const SizedBox(height: 20),

                /// الزرار:
                CustomElevatedButton(
                  text: 'تاكيد دفع الرسوم التنظيمية',
                  onPressed: () {
                    log('message');
                    bool termsAccepted =
                        context.read<CheckboxCubit>().state.isChecked;
                    bool warningAccepted =
                        context.read<CheckboxCubit>().state.isChecked;

                    log(
                      'termsAccepted = $termsAccepted warningAccepted = $warningAccepted',
                    );

                    if (!termsAccepted || !warningAccepted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('يرجى الموافقة على الشروط والأحكام'),
                        ),
                      );
                      return;
                    }

                    // هنا بنشغل الكيوبت
                    context.read<SubscribeAuctionCubit>().subscribeToAuction(
                      SubscribeAutionBody(
                        registrationCount: registrationAmount.toInt(),

                        auctionId: auctionId.toInt(),
                        termsConditions: true,
                      ),
                    );
                  },
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
                builder: (context) => const TermsAndConditionsScreen(),
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
