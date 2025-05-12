import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';

class CustomJaraaPriceCard extends StatefulWidget {
  const CustomJaraaPriceCard({super.key});

  @override
  State<CustomJaraaPriceCard> createState() => _CustomJaraaPriceCardState();
}

class _CustomJaraaPriceCardState extends State<CustomJaraaPriceCard> {
  TextEditingController? controller;
  int selectedIndex = 0;
  int selectedValue = 5;

  final List<int> values = [5, 10, 50, 100];
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(values.length, (index) {
            final isSelected = selectedIndex == index;
            final value = values[index];

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    selectedValue = value;
                  });
                },
                child:
                    isSelected
                        ? SelectedButton(label: value.toString())
                        : UnselectedButton(label: value.toString()),
              ),
            );
          }),
        ),
        SizedBox(height: 10.h),
        CustomTextForm(
          controller: controller,
          hintText: 'المبلغ الذي تريد المزايدة به',
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 10.h),
        Text(
          'تنبية : الفاتورة ستصلك بعد انتهاء المزاد',
          style: R.textStyles.font14Grey400Light.copyWith(
            color: R.colors.redColor,
          ),
        ),
        const SizedBox(height: 24),
        CustomElevatedButton(
          text: 'زاود',
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  backgroundColor: R.colors.whiteLight,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: ' هل متأكد من المزايده بهذا المبلغ  ',
                                  style: R.textStyles.font18blackW500Light,
                                ),

                                TextSpan(
                                  text:
                                      (controller != null &&
                                              controller!.text.isNotEmpty)
                                          ? '${controller!.text} '
                                          : '$selectedValue ',
                                  style: R.textStyles.font18primaryW500Light,
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(R.images.riyalPrimaryIcon),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            text: 'نعم',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(width: 30.w),
                        Expanded(
                          child: CustomElevatedButton(
                            backgroundColor: R.colors.blackColor3,

                            text: 'لا',
                            textStyle: R.textStyles.font14BlackW500Light,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
          backgroundColor: R.colors.greenColor,
        ),
      ],
    );
  }
}

class SelectedButton extends StatelessWidget {
  final String label;
  const SelectedButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: R.colors.primaryColorLight,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: R.textStyles.font14whiteW500Light),
          SizedBox(width: 4.w),
          SvgPicture.asset(R.images.riyalwhiteIcont),
        ],
      ),
    );
  }
}

class UnselectedButton extends StatelessWidget {
  final String label;
  const UnselectedButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: R.colors.whiteLight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: R.colors.blackColor3, width: 2),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: R.textStyles.font14primaryW500Light),
          SizedBox(width: 4.w),
          SvgPicture.asset(R.images.riyalPrimaryIcon),
        ],
      ),
    );
  }
}
