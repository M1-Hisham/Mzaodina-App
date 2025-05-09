import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 50.w,
            maxWidth: 100.w,
            minHeight: 35.h,
            maxHeight: 40.h,
          ),
          child: CustomElevatedButton(
            borderRadius: 8,
            textDirection: TextDirection.rtl,
            text: 'مشاركة',
            onPressed: () {},
            textStyle: R.textStyles.font12primaryW600Light,
            backgroundColor: R.colors.colorUnSelected,
            icon: SvgPicture.asset(R.images.shareIcon),
          ),
        ),
        Spacer(),
        Text(title, style: R.textStyles.font14BlackW500Light),
        Spacer(),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(R.images.backIcon),
        ),
      ],
    );
  }
}
