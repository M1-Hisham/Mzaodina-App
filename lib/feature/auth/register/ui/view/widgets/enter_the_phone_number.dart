import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';
import 'package:mzaodina_app/core/widgets/uni_country_city_picker.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/phone_code_cubit/phone_code_cubit.dart';
import 'package:uni_country_city_picker/uni_country_city_picker.dart';

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
  final _uniCountryServices = UniCountryServices.instance;
  List<Country> countries = [];
  // @override
  // void initState() {
  //   super.initState();
  //   final phoneCodeCubit = context.read<PhoneCodeCubit>();

  // نعيد التهيئة دايمًا لو فيه قيم مبدئية
  // if (widget.initialPhoneCode != null && widget.initialPhoneFlag != null) {
  //   phoneCodeCubit.updatePhoneCode(
  //     widget.initialPhoneFlag!,
  //     widget.initialPhoneCode!,
  //   );
  // }
  // }

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  Future<void> loadCountries() async {
    countries = await _uniCountryServices.getCountriesAndCities();
    if (mounted) {
      setState(() {});
      if (widget.initialPhoneCode != null) {
        _initializeCountryState();
      }
    }
  }

  void _initializeCountryState() {
    final country = countries.firstWhere(
      (c) => c.isoCode == widget.initialPhoneCode,
      orElse:
          () => Country(
            name: 'Unknown',
            nameEn: 'Unknown',
            dialCode: widget.initialPhoneCode ?? '+00',
            flag: _getFlagEmoji(widget.initialPhoneFlag!),
            isoCode: widget.initialPhoneCode!,
            cities: [],
            phoneDigitsLength: 0,
            phoneDigitsLengthMax: 0,
          ),
    );

    context.read<PhoneCodeCubit>().updatePhoneCode(
      country.flag,
      country.dialCode,
    );
  }

  String _getFlagEmoji(String countryCode) {
    return countryCode.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
      (m) => String.fromCharCode(m.group(0)!.codeUnitAt(0) + 127397),
    );
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
                List<Country> filteredCountries = countries;
                final searchController = TextEditingController();

                return StatefulBuilder(
                  builder: (context, setState) {
                    void onSearch(String? query) {
                      setState(() {
                        filteredCountries =
                            countries
                                .where(
                                  (country) =>
                                      country.name.contains(query!) ||
                                      country.nameEn.toLowerCase().contains(
                                        query.toLowerCase(),
                                      ),
                                )
                                .toList();
                      });
                    }

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextForm(
                            controller: searchController,
                            hintText: 'ابحث عن دولة...',
                            onSaved: onSearch,
                          ),
                        ),

                        SizedBox(height: 12.h),
                        Expanded(
                          child: ListView.builder(
                            itemCount: filteredCountries.length,

                            itemBuilder: (context, index) {
                              final country = filteredCountries[index];
                              return ListTile(
                                title: Text('${country.flag} ${country.name}'),
                                onTap: () {
                                  context
                                      .read<PhoneCodeCubit>()
                                      .updatePhoneCode(
                                        country.flag,
                                        country.dialCode,
                                      );
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 9, vertical: 14),
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
