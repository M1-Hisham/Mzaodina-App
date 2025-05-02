import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CustomAppBarAccount extends StatelessWidget {
  final String title;
  const CustomAppBarAccount({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12, top: 12),
        child: Row(
          children: [
            Text(title, style: R.textStyles.font18blackW500Light),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(R.images.backIcon),
            ),
          ],
        ),
      ),
    );
  }
}
