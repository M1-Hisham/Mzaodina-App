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
  late Animation<double> _backgroundAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _logoAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _backgroundAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.authRouter);
    });}
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
            FadeTransition(
              opacity: _backgroundAnimation,
              child: Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: SvgPicture.asset(
                        R.images.appLogoFram37,
                        width: 150.w,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: SvgPicture.asset(
                        R.images.appLogoFram38,
                        width: 150.w,
                      ),
                    ),
                  ],
                ),
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

