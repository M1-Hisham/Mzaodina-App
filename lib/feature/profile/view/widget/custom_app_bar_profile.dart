import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CustomAppBarProfile extends StatelessWidget {
  final String title;
  const CustomAppBarProfile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'اهلا”',
          style: R.textStyles.font18GreyW500Light.copyWith(
            color: R.colors.greyColor3,
          ),
        ),
        Text(title, style: R.textStyles.font18primaryW500Light),
      ],
    );
  }
}
