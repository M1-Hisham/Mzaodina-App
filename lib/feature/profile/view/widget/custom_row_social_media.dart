import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomRowSocialMedia extends StatelessWidget {
  const CustomRowSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            if (await canLaunchUrl(Uri.parse('https://x.com/Mzaodin'))) {
              // Check if the URL can be launched
              await launchUrl(
                Uri.parse('https://x.com/Mzaodin'),
                mode: LaunchMode.externalApplication,
              ); // Launch the URL
            } else {
              // Handle the error if the URL cannot be launched
              debugPrint('Could not launch URL');
              SnackBar(content: Text('Could not launch URL'));
              // throw 'Could not launch'; // throw could be used to handle erroneous situations
            }
          },
          child: SvgPicture.asset(R.images.xIcon, width: 25.w, height: 25.h),
        ),
        SizedBox(width: 18.h),
        InkWell(
          onTap: () async {
            if (await canLaunchUrl(
              Uri.parse('https://www.tiktok.com/@mzaodin'),
            )) {
              // Check if the URL can be launched
              await launchUrl(
                Uri.parse('https://www.tiktok.com/@mzaodin'),
                mode: LaunchMode.externalApplication,
              ); // Launch the URL
            } else {
              // Handle the error if the URL cannot be launched
              debugPrint('Could not launch URL');
              SnackBar(content: Text('Could not launch URL'));
              // throw 'Could not launch'; // throw could be used to handle erroneous situations
            }
          },
          child: SvgPicture.asset(
            R.images.tiktokIcon,
            width: 25.w,
            height: 25.h,
          ),
        ),
        SizedBox(width: 18.h),
        InkWell(
          onTap: () async {
            if (await canLaunchUrl(
              Uri.parse('https://www.instagram.com/mzaodin/?hl=ar'),
            )) {
              // Check if the URL can be launched
              await launchUrl(
                Uri.parse('https://www.instagram.com/mzaodin/?hl=ar'),
                mode: LaunchMode.externalApplication,
              ); // Launch the URL
            } else {
              // Handle the error if the URL cannot be launched
              debugPrint('Could not launch URL');
              SnackBar(content: Text('Could not launch URL'));
              // throw 'Could not launch'; // throw could be used to handle erroneous situations
            }
          },
          child: SvgPicture.asset(
            R.images.instaIcon,
            width: 25.w,
            height: 25.h,
          ),
        ),

        SizedBox(width: 18.h),
        InkWell(
          onTap: () async {
            if (await canLaunchUrl(
              Uri.parse('https://www.snapchat.com/add/mzaodin'),
            )) {
              // Check if the URL can be launched
              await launchUrl(
                Uri.parse('https://www.snapchat.com/add/mzaodin'),
                mode: LaunchMode.externalApplication,
              ); // Launch the URL
            } else {
              // Handle the error if the URL cannot be launched
              debugPrint('Could not launch URL');
              SnackBar(content: Text('Could not launch URL'));
              // throw 'Could not launch'; // throw could be used to handle erroneous situations
            }
          },
          child: SvgPicture.asset(R.images.snapIcon, width: 25.w, height: 25.h),
        ),
        Spacer(),

        InkWell(
          onTap: () async {
            await launchUrlString(
              'https://wa.me/+966533576110?text=Hello,\ni\'m coming from App Mzaodina',
              mode: LaunchMode.externalApplication,
            );
          },
          child: Container(
            width: 136.w,
            decoration: BoxDecoration(
              color: R.colors.greenColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('تواصل واتس أب', style: R.textStyles.font10whiteW500Light),
                SvgPicture.asset(R.images.whatsIcon),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
