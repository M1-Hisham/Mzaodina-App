import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/check-box/view-model/check_box_cubit.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/subscribe_aution_body.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/subscribe_auction-cubit/subscribe_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/join-auction/view/join_the_auction.dart';
import 'package:mzaodina_app/feature/home/join-auction/view/widgets/counter_cubit_inc_dec.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_indcator_item.dart';

class CounterView extends StatelessWidget {
  final int requiredBidders;
  final double openingAmount;
  final double registrationAmount;
  final int auctionId;
  final double auctionStartRate;
  final int currentBidders;
  const CounterView({
    super.key,
    required this.requiredBidders,
    required this.openingAmount,
    required this.registrationAmount,
    required this.auctionId,
    required this.auctionStartRate,
    required this.currentBidders,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubscribeAuctionCubit, SubscribeToAuctionState>(
      listener: (context, state) {
        if (state is SubscribeAuctionError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: BlocProvider(
        create:
            (_) => CounterCubitIncDec(
              maxValue:
                  (requiredBidders - currentBidders) +
                  CounterCubitIncDec.minValue,
              price: registrationAmount.toDouble(),
            ),
        child: BlocBuilder<CounterCubitIncDec, int>(
          builder: (context, count) {
            return Column(
              children: [
                CustomIndcatorItem(
                  title: 'نسبة انطلاق المزاد',
                  showIndicator: false,
                  value:
                      (auctionStartRate + ((100 / (requiredBidders)) * count))
                          .round(),
                  style: R.textStyles.font14Grey3W500Light,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // increment button
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      style: IconButton.styleFrom(
                        backgroundColor: R.colors.primaryColorLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(10),
                      ),
                      onPressed:
                          () => context.read<CounterCubitIncDec>().increment(),
                    ),
                    const SizedBox(width: 20),
                    // result
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: Text('$count')),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // decrement button
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.white),
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xFF18224F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(10),
                      ),
                      onPressed:
                          () =>
                              count == 0
                                  ? null
                                  : context
                                      .read<CounterCubitIncDec>()
                                      .decrement(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CoustomRowItem(
                  title: 'مجموع القيمة',
                  price: context
                      .read<CounterCubitIncDec>()
                      .totalAmount
                      .toStringAsFixed(2),
                ),
                const SizedBox(height: 25),
                WarningCheckbox(),
                TermsAndConditionsCheckbox(),
                const SizedBox(height: 20),

                /// الزرار:
                CustomElevatedButton(
                  text: 'تاكيد دفع الرسوم التنظيمية',
                  onPressed: () async {
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
                          content: Text('يجب الموافقة على الشروط والأحكام'),
                        ),
                      );
                      return;
                    }

                    // ✅ عرض Dialog تحميل على طول
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder:
                          (_) => AlertDialog(
                            backgroundColor: R.colors.whiteLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            title: Container(
                              padding: EdgeInsets.all(18),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'لاتغلق النافذه',
                                    style: R.textStyles.font18blackW500Light,
                                  ),
                                  SizedBox(height: 16),
                                  Image.asset(
                                    R.images.loadingJsonIcon,

                                    width: 75,
                                    height: 75,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                    );

                    // ✅ نفذ الكيوبت فورًا
                    context.read<SubscribeAuctionCubit>().subscribeToAuction(
                      SubscribeAutionBody(
                        registrationCount: count,
                        auctionId: auctionId.toInt(),
                        termsConditions: true,
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
