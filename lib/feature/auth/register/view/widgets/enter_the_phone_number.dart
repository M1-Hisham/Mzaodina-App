import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/auth/widgets/auth_text_form.dart';

class EnterThePhoneNumber extends StatefulWidget {
  const EnterThePhoneNumber({super.key});

  @override
  State<EnterThePhoneNumber> createState() => _EnterThePhoneNumberState();
}

class _EnterThePhoneNumberState extends State<EnterThePhoneNumber> {
  final TextEditingController _phoneNumberController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: '966',
    countryCode: 'SA',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Saudi Arabia',
    example: '+966 5 5555 5555',
    displayName: 'Saudi Arabia',
    displayNameNoCountryCode: 'SA',
    e164Key: '',
  );
  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthTextForm(
      controller: _phoneNumberController,
      // autocorrect: false,
      // maxLength: 10,
      keyboardType: TextInputType.number,
      hintText: 'رقم الهاتف',
      prefixIcon: Container(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: true,
              countryListTheme: CountryListThemeData(bottomSheetHeight: 550.h),
              onSelect: (value) {
                setState(() {
                  selectedCountry = value;
                });
              },
            );
          },
          child: RichText(
            text: TextSpan(
              text: selectedCountry.flagEmoji,
              style: TextStyle(fontSize: 20.sp),
              children: [
                TextSpan(
                  text: ' +${selectedCountry.phoneCode}   ',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: R.colors.textColorLight,
                  ),
                ),
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
      ),
    );
  }
}
