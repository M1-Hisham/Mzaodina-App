import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CustomTextItem extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const CustomTextItem({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text('•', style: R.textStyles.font12Grey3W500Light),
          SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style:
                  style ??
                  R.textStyles.font12Grey3W500Light.copyWith(height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}
