// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:mzaodina_app/core/resources/resources.dart';
// import 'package:mzaodina_app/core/widgets/custom_text_form.dart';
// import 'package:mzaodina_app/core/widgets/uni_country_city_picker.dart';

// class EnterThePhoneNumber extends StatefulWidget {
//   final TextStyle? hintStyle;
//   final Color? fillColor;
//   const EnterThePhoneNumber({super.key, this.hintStyle, this.fillColor});

//   @override
//   State<EnterThePhoneNumber> createState() => _EnterThePhoneNumberState();
// }

// class _EnterThePhoneNumberState extends State<EnterThePhoneNumber> {
//   final TextEditingController _phoneNumberController = TextEditingController();
//   String? selectedCountryCode;
//   String? selectedCountryFlag;

//   @override
//   Widget build(BuildContext context) {
//     return CustomTextForm(
//       controller: _phoneNumberController,
//       // autocorrect: false,
//       // maxLength: 10,
//       keyboardType: TextInputType.number,
//       hintText: 'رقم الهاتف',
//       fillColor: widget.fillColor ?? R.colors.formColorLight,
//       hintStyle:
//           widget.hintStyle ??
//           R.textStyles.font12Grey3W500Light.copyWith(
//             color: R.colors.hintTextColorLight,
//           ),
//       prefixIcon: Container(
//         padding: const EdgeInsets.all(10),
//         child: InkWell(
//           onTap: () {
//             showBottomSheet(
//               showDragHandle: true,
//               enableDrag: true,
//               backgroundColor: R.colors.whiteLight,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40.r),
//                   topRight: Radius.circular(40.r),
//                 ),
//               ),
//               constraints: BoxConstraints(
//                 maxHeight: MediaQuery.of(context).size.height / 1.8,
//               ),
//               context: context,
//               builder: (context) {
//                 return CountriesAndCitiesView(
//                   onCountrySelected: (country) {
//                     setState(() {
//                       selectedCountryCode = country.dialCode;
//                       selectedCountryFlag = country.flag;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 );
//               },
//             );
//           },
//           child: RichText(
//             text: TextSpan(
//               text:
//                   '${selectedCountryFlag ?? '🇸🇦'} ${selectedCountryCode ?? '+966'}  ',
//               style: R.textStyles.font16BlackW400Light.copyWith(height: 0),
//               children: [
//                 WidgetSpan(
//                   alignment: PlaceholderAlignment.middle,
//                   child: SvgPicture.asset(
//                     R.images.dropDownIcon,
//                     width: 14.w,
//                     height: 8.h,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/country_cubit/country_cubit.dart';

class EnterThePhoneNumber extends StatefulWidget {
  final TextStyle? hintStyle;
  final Color? fillColor;

  final TextEditingController? phoneNumberController;
  const EnterThePhoneNumber({
    super.key,
    this.hintStyle,
    this.fillColor,
    this.phoneNumberController,
  });

  @override
  State<EnterThePhoneNumber> createState() => _EnterThePhoneNumberState();
}

class _EnterThePhoneNumberState extends State<EnterThePhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, CountryState>(
      builder: (context, state) {
        String countryCode = '+966';
        String countryFlag = '🇸🇦';

        if (state is CountrySelected) {
          countryFlag = state.flag;
          countryCode = state.dialCode;
        }

        return CustomTextForm(
          controller: widget.phoneNumberController,
          keyboardType: TextInputType.number,
          hintText: 'رقم الهاتف',
          fillColor: widget.fillColor ?? R.colors.formColorLight,
          hintStyle:
              widget.hintStyle ??
              R.textStyles.font12Grey3W500Light.copyWith(
                color: R.colors.hintTextColorLight,
              ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                text: '$countryFlag $countryCode  ',
                style: R.textStyles.font16BlackW400Light.copyWith(height: 0),
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: SvgPicture.asset(
                      R.images.dropDownIcon,
                      width: 14.w,
                      height: 8.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
