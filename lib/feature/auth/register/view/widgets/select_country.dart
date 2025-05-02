import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class SelectCountry extends StatefulWidget {
  final Color? color;
  const SelectCountry({super.key, this.color,});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  final TextEditingController _phoneNumberController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: '966',
    countryCode: 'SA',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Saudi Arabia',
    example: '+966 5 5555 5555',
    displayName: 'المملكة العربية السعودية',
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
    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          countryListTheme: CountryListThemeData(bottomSheetHeight: 550.h),
          onSelect: (value) {
            setState(() {
              selectedCountry = value;
            });
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.dg, horizontal: 12.dg),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),

          color: widget.color ?? R.colors.formColorLight,
          border: Border.all(color: R.colors.borderColorsLight),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedCountry.name}  ${selectedCountry.flagEmoji}',
              style:  const TextStyle(fontSize: 18),
            ),
            SvgPicture.asset(R.images.dropDownIcon, width: 14.w, height: 8.h),
          ],
        ),
      ),
    );
  }
}
