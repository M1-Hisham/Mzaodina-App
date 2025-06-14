import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _logoAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    Future.delayed(Duration(milliseconds: 1500), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, AppRoutes.navBarRoute);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  top: 0,

                  right: 0,
                  child: SvgPicture.asset(R.images.appLogoFram37, width: 150.w),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SvgPicture.asset(R.images.appLogoFram38, width: 150.w),
                ),
              ],
            ),
          ),

          Center(
            child: ScaleTransition(
              scale: _logoAnimation,
              child: Image.asset(
                R.images.appLogoPng,
                width: 150.w,
                height: 150.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
