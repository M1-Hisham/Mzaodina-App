import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/country_cubit/country_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/user_data_cubit/user_data_cubit.dart';
import 'package:uni_country_city_picker/uni_country_city_picker.dart';

class EnterThePhoneNumber extends StatefulWidget {
  final TextStyle? hintStyle;
  final Color? fillColor;
  final bool? isValidator;
  final TextEditingController? phoneNumberController;

  const EnterThePhoneNumber({
    super.key,
    this.hintStyle,
    this.fillColor,
    this.phoneNumberController,
    this.isValidator,
  });

  @override
  State<EnterThePhoneNumber> createState() => _EnterThePhoneNumberState();
}

class _EnterThePhoneNumberState extends State<EnterThePhoneNumber> {
  final _uniCountryServices = UniCountryServices.instance;
  List<Country> countries = [];

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  Future<void> loadCountries() async {
    countries = await _uniCountryServices.getCountriesAndCities();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, CountryState>(
      builder: (context, state) {
        String countryCode = '+966';
        String countryFlag = '🇸🇦';

        if (state is CountrySelected) {
          countryFlag = state.flag;
          countryCode = state.dialCode;
        } else {
          final userState = context.read<UserDataCubit>().state;

          if (userState is UserDataSuccess && countries.isNotEmpty) {
            final iso =
                userState.userModel.data?.country?.toUpperCase() ?? 'SA';

            final foundCountry = countries.firstWhere(
              (c) => c.isoCode == iso,
              orElse:
                  () => Country(
                    name: 'Unknown',
                    nameEn: 'Unknown',
                    dialCode: '+966',
                    flag: '',
                    isoCode: iso,
                    cities: [],
                    phoneDigitsLength: 0,
                    phoneDigitsLengthMax: 0,
                  ),
            );

            countryCode = foundCountry.dialCode;
            countryFlag = iso.replaceAllMapped(
              RegExp(r'[A-Z]'),
              (m) => String.fromCharCode(m.group(0)!.codeUnitAt(0) + 127397),
            );
          }
        }

        return CustomTextForm(
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
          prefixIcon: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$countryFlag $countryCode',
                  style: R.textStyles.font16BlackW400Light,
                ),
                SizedBox(width: 6.w),
                SvgPicture.asset(
                  R.images.dropDownIcon,
                  width: 14.w,
                  height: 8.h,
                ),
                SizedBox(width: 8.w),
                Container(height: 20.h, width: 1, color: Colors.grey.shade400),
                SizedBox(width: 6.w),
              ],
            ),
          ),
        );
      },
    );
  }
}
