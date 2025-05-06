import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/check-box/view-model/check_box_cubit.dart';
import 'package:mzaodina_app/core/widgets/check-box/view/custom_check_box.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/home/join-auction/view/widgets/counter_view.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_indcator_item.dart';
import 'package:mzaodina_app/feature/profile/terms&conditions/view/terms_and_conditions_screen.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';

class JoinTheAuction extends StatelessWidget {
  const JoinTheAuction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const CustomAppBarAccount(title: 'الرسوم التنظيمية'),
              const CoustomRowItem(title: 'الرسوم التنظيمية', price: '30.00 '),
              CustomIndcatorItem(
                title: 'نسبة انطلاق المزاد',
                showIndicator: false,
                style: R.textStyles.font14Grey3W500Light,
              ),
              const SizedBox(height: 20),
              CounterView(),
              const SizedBox(height: 10),
              const CoustomRowItem(title: 'مجموع القيمة', price: '30.00 '),
              const SizedBox(height: 30),
              _warning(),
              _termsAndConditions(context),
              const SizedBox(height: 20),
              CustomElevatedButton(
                text: 'تاكيد دفع الرسوم التنظيمية',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        backgroundColor: R.colors.whiteLight,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          child: FittedBox(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'تم الاشتراك  ',
                                    style: R.textStyles.font22blackW500Light,
                                  ),
                                  TextSpan(
                                    text: 'فى المزاد ',
                                    style: R.textStyles.font22blackW500Light
                                        .copyWith(
                                          color: R.colors.primaryColorLight,
                                        ),
                                  ),
                                  TextSpan(
                                    text: 'بنجاح',
                                    style: R.textStyles.font22blackW500Light,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        actions: [
                          SizedBox(height: 18),
                          CustomElevatedButton(
                            text: 'اغلاق',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _warning() {
    return Row(
      children: [
        BlocProvider(
          create: (context) => CheckboxCubit(initialValue: false),
          child: const CustomCheckbox(),
        ),
        Expanded(
          child: Text(
            'تنبيه : الرسوم تساعدنا فى تنظيم المزاد وضمان الجدية بين المشاركين. نعتذر لايمكن استردادها',
            style: R.textStyles.font14Grey400Light.copyWith(
              color: Color(0xFFF32828),
            ),
          ),
        ),
      ],
    );
  }

  Widget _termsAndConditions(context) {
    return Row(
      children: [
        BlocProvider(
          create: (context) => CheckboxCubit(initialValue: false),
          child: const CustomCheckbox(),
        ),
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
