import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';
import 'package:mzaodina_app/core/widgets/uni_country_city_picker.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/phone_code_cubit/phone_code_cubit.dart';

class EnterThePhoneNumber extends StatefulWidget {
  final TextStyle? hintStyle;
  final Color? fillColor;
  final bool? isValidator;
  final TextEditingController? phoneNumberController;
  final String? initialPhoneCode;
  final String? initialPhoneFlag;

  const EnterThePhoneNumber({
    super.key,
    this.hintStyle,
    this.fillColor,
    this.phoneNumberController,
    this.isValidator,
    this.initialPhoneCode,
    this.initialPhoneFlag,
  });

  @override
  State<EnterThePhoneNumber> createState() => _EnterThePhoneNumberState();
}

class _EnterThePhoneNumberState extends State<EnterThePhoneNumber> {
  @override
  void initState() {
    super.initState();
    final phoneCodeCubit = context.read<PhoneCodeCubit>();

    // نعيد التهيئة دايمًا لو فيه قيم مبدئية
    if (widget.initialPhoneCode != null && widget.initialPhoneFlag != null) {
      phoneCodeCubit.updatePhoneCode(
        widget.initialPhoneFlag!,
        widget.initialPhoneCode!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showBottomSheet(
              showDragHandle: true,
              enableDrag: true,
              backgroundColor: R.colors.whiteLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 1.8,
              ),
              context: context,
              builder: (context) {
                return CountriesAndCitiesView(
                  country: true,
                  onCountrySelected: (country) {
                    context.read<PhoneCodeCubit>().updatePhoneCode(
                      country.flag,
                      country.dialCode,
                    );
                    Navigator.of(context).pop();
                  },
                );
              },
            );
          },
          child: Container(
            padding: EdgeInsets.all(9.5.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              color: widget.fillColor ?? R.colors.formColorLight,
              border: Border.all(color: R.colors.borderColorsLight),
            ),
            child: BlocBuilder<PhoneCodeCubit, PhoneCodeState>(
              builder: (context, state) {
                String flag = '🇸🇦';
                String code = '+966';

                if (state is PhoneCodeSelected) {
                  flag = state.flag;
                  code = state.dialCode;
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$flag $code', style: TextStyle(fontSize: 17.sp)),
                    SvgPicture.asset(
                      R.images.dropDownIcon,
                      width: 14.w,
                      height: 8.h,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: CustomTextForm(
            controller: widget.phoneNumberController,
            keyboardType: TextInputType.number,
            isValidator: widget.isValidator ?? true,
            hintText: 'رقم الهاتف',
            fillColor: widget.fillColor ?? R.colors.formColorLight,
            hintStyle:
                widget.hintStyle ??
                R.textStyles.font12Grey3W500Light.copyWith(
                  color: R.colors.hintTextColorLight,
                ),
          ),
        ),
      ],
    );
  }
}
