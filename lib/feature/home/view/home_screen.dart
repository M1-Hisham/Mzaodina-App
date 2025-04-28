import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/app_colors.dart';
import 'package:mzaodina_app/core/resources/app_text_styles.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [CustomAppBar()]));
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 28, left: 28),
      width: 402,
      height: 160,
      decoration: BoxDecoration(
        color: R.colors.primaryColorLight,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(

        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Text('أهلاً وسهلاً,', style: R.textStyles.font18GreyW500Light),
            SizedBox(height: 7),
            Row(
              children: [
                Text(
                  '👋 فهد القحطاني',
                  style: R.textStyles.font18WhiteW500Light,
                ),
                Spacer(),
                Stack(
                  children: [
                    SvgPicture.asset(R.images.iconNotiv),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: R.colors.redColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
