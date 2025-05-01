import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CustomAccountListTile extends StatelessWidget {
  final String title;
  final Widget? leading;

  const CustomAccountListTile({super.key, required this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 14),
      decoration: BoxDecoration(color: R.colors.blackColor3),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        minTileHeight: 0,
        minLeadingWidth: 0,
        trailing: SvgPicture.asset(R.images.backIconNotBorser),
        title: Text(title, style: R.textStyles.font14Grey3W500Light),

        leading: leading,
      ),
    );
  }
}
