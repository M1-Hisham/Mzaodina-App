import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CustomTextMazadDetails extends StatelessWidget {
  final String title;
  const CustomTextMazadDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(title, style: R.textStyles.font16primaryW600Light),
        ),
        Container(
          width: 70.w,
          height: 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [R.colors.primaryColorLight, Colors.transparent],
            ),
          ),
        ),
      ],
    );
  }
}
