import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/check-box/view/custom_check_box.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void _showAuctionSuccessDialog(BuildContext context) async {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder:
  //         (context) => Dialog(
  //           backgroundColor: Colors.transparent,
  //           elevation: 0,
  //           child: Center(
  //             child: Container(
  //               width: double.infinity,
  //               padding: EdgeInsets.all(20.r),
  //               decoration: BoxDecoration(
  //                 color: R.colors.whiteLight,
  //                 borderRadius: BorderRadius.circular(22),
  //               ),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   Text(
  //                     'لاتغلق النافذه',
  //                     style: R.textStyles.font18blackW500Light,
  //                     textAlign: TextAlign.center,
  //                   ),
  //                   SizedBox(height: 20.h),
  //                   Image.asset(
  //                     'assets/icons/loadingJsonIcon.gif',
  //                     width: 48.w,
  //                     height: 48.h,
  //                     fit: BoxFit.contain,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //   );
  //   bool isCancelled = false;
  //   await Future.delayed(const Duration(seconds: 2)).catchError((_) {
  //     isCancelled = true;
  //   });
  //   if (!isCancelled && context.mounted) {
  //     Navigator.of(context).pop();
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder:
  //           (_) => AlertDialog(
  //             backgroundColor: R.colors.whiteLight,
  //             contentPadding: EdgeInsets.all(20.r),
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(22),
  //             ),
  //             title: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 FittedBox(
  //                   fit: BoxFit.scaleDown,
  //                   child: Text.rich(
  //                     TextSpan(
  //                       children: [
  //                         TextSpan(
  //                           text: 'تم الاشتراك ',
  //                           style: R.textStyles.font22blackW500Light,
  //                         ),
  //                         TextSpan(
  //                           text: 'في المزاد ',
  //                           style: R.textStyles.font22blackW500Light.copyWith(
  //                             color: R.colors.primaryColorLight,
  //                           ),
  //                         ),
  //                         TextSpan(
  //                           text: 'بنجاح',
  //                           style: R.textStyles.font22blackW500Light,
  //                         ),
  //                       ],
  //                     ),
  //                     textAlign: TextAlign.center,
  //                   ),
  //                 ),
  //                 SizedBox(height: 20.h),
  //                 CustomElevatedButton(
  //                   text: 'اغلاق',
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //     );
  //   }
  // }
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
