import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/country_cubit/country_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/user_data_cubit/user_data_cubit.dart';
import 'package:uni_country_city_picker/uni_country_city_picker.dart';

class SelectCountry extends StatefulWidget {
  final Color? color;
  final String? initialCountryCode;
  final String? initialPhoneCode;
  const SelectCountry({
    super.key,
    this.color,
    this.initialCountryCode,
    this.initialPhoneCode,
  });

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  final _uniCountryServices = UniCountryServices.instance;
  List<Country> countries = [];

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  Future<void> loadCountries() async {
    countries = await _uniCountryServices.getCountriesAndCities();
    if (mounted) {
      setState(() {});
      if (widget.initialCountryCode != null) {
        _initializeCountryState();
      }
    }
  }

  void _initializeCountryState() {
    final country = countries.firstWhere(
      (c) => c.isoCode == widget.initialCountryCode,
      orElse:
          () => Country(
            name: 'Unknown',
            nameEn: 'Unknown',
            dialCode: widget.initialPhoneCode ?? '+00',
            flag: _getFlagEmoji(widget.initialCountryCode!),
            isoCode: widget.initialCountryCode!,
            cities: [],
            phoneDigitsLength: 0,
            phoneDigitsLengthMax: 0,
          ),
    );

    context.read<CountryCubit>().updateCountry(
      country.flag,
      country.dialCode,
      country.name,
      country.isoCode,
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
    return GestureDetector(
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
                              context.read<CountryCubit>().updateCountry(
                                country.flag,
                                country.dialCode,
                                country.name,
                                country.isoCode,
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
        padding: EdgeInsets.all(9.5.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          color: widget.color ?? R.colors.formColorLight,
          border: Border.all(color: R.colors.borderColorsLight),
        ),
        child: BlocBuilder<CountryCubit, CountryState>(
          builder: (context, countryState) {
            if (countryState is CountrySelected) {
              return _buildCountryRow(
                flag: countryState.flag,
                name: countryState.name,
              );
            } else {
              return BlocBuilder<UserDataCubit, UserDataState>(
                builder: (context, userDataState) {
                  if (userDataState is UserDataSuccess &&
                      countries.isNotEmpty) {
                    final code = userDataState.userModel.data?.country;
                    if (code != null) {
                      final country = countries.firstWhere(
                        (c) => c.isoCode == code,
                        orElse:
                            () => Country(
                              name: 'Unknown',
                              nameEn: 'Unknown',
                              dialCode:
                                  userDataState.userModel.data?.phoneCode ??
                                  '+00',
                              flag: _getFlagEmoji(code),
                              isoCode: code,
                              cities: [],
                              phoneDigitsLength: 0,
                              phoneDigitsLengthMax: 0,
                            ),
                      );

                      return _buildCountryRow(
                        flag: country.flag,
                        name: country.name,
                      );
                    }
                  }

                  return _buildCountryRow(
                    flag: '🇸🇦',
                    name: 'المملكة العربية السعودية',
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildCountryRow({required String flag, required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$flag $name', style: TextStyle(fontSize: 17.sp)),
        SvgPicture.asset(R.images.dropDownIcon, width: 14.w, height: 8.h),
      ],
    );
  }
}
