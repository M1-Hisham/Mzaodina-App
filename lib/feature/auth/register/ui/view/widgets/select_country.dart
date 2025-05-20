// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:mzaodina_app/core/resources/resources.dart';
// import 'package:mzaodina_app/core/widgets/uni_country_city_picker.dart';

// class SelectCountry extends StatefulWidget {
//   final Color? color;
//   const SelectCountry({super.key, this.color});

//   @override
//   State<SelectCountry> createState() => _SelectCountryState();
// }

// class _SelectCountryState extends State<SelectCountry> {
//   String? selectedCountryName;
//   String? selectedCountryFlag;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showBottomSheet(
//           showDragHandle: true,
//           enableDrag: true,
//           backgroundColor: R.colors.whiteLight,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(40.r),
//               topRight: Radius.circular(40.r),
//             ),
//           ),
//           constraints: BoxConstraints(
//             maxHeight: MediaQuery.of(context).size.height / 1.8,
//           ),
//           context: context,
//           builder: (context) {
//             return CountriesAndCitiesView(
//               country: true,
//               onCountrySelected: (country) {
//                 setState(() {
//                   selectedCountryName = country.name;
//                   selectedCountryFlag = country.flag;
//                 });
//                 Navigator.of(context).pop();
//               },
//             );
//           },
//         );
//       },
//       child: Container(
//         padding: EdgeInsets.all(9.5.r),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(8.r)),

//           color: widget.color ?? R.colors.formColorLight,
//           border: Border.all(color: R.colors.borderColorsLight),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               '${selectedCountryFlag ?? ''} ${selectedCountryName ?? '🇸🇦 المملكة العربية السعودية'}',
//               style: TextStyle(fontSize: 17.sp),
//             ),
//             SvgPicture.asset(R.images.dropDownIcon, width: 14.w, height: 8.h),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/uni_country_city_picker.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/country_cubit/country_cubit.dart';

class SelectCountry extends StatelessWidget {
  final Color? color;
  const SelectCountry({super.key, this.color});

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
            return CountriesAndCitiesView(
              country: true,
              onCountrySelected: (country) {
                context.read<CountryCubit>().updateCountry(
                  country.flag,
                  country.dialCode,
                  country.name,
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
          color: color ?? R.colors.formColorLight,
          border: Border.all(color: R.colors.borderColorsLight),
        ),
        child: BlocBuilder<CountryCubit, CountryState>(
          builder: (context, state) {
            if (state is CountrySelected) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${state.flag} ${state.name}',
                    style: TextStyle(fontSize: 17.sp),
                  ),
                  SvgPicture.asset(
                    R.images.dropDownIcon,
                    width: 14.w,
                    height: 8.h,
                  ),
                ],
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '🇸🇦 المملكة العربية السعودية',
                  style: TextStyle(fontSize: 17.sp),
                ),
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
    );
  }
}
