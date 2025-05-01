import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/feature/home/ui/view/home_details_screen.dart';
import 'package:mzaodina_app/feature/home/ui/view/home_screen.dart';
import 'package:mzaodina_app/feature/nav_bar/view/nav_bar.dart';
import 'package:mzaodina_app/feature/auth/ui/view-model/cubit/auth_cubit_cubit.dart';
import 'package:mzaodina_app/feature/auth/ui/view/auth_screen.dart';
import 'package:mzaodina_app/feature/profile/view/about_us_screen.dart';
import 'package:mzaodina_app/feature/splash/splash_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splasahRouter:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
         case AppRoutes.homeDetailsRoute:
        return MaterialPageRoute(builder: (_) => HomeDetailsScreen());
      case AppRoutes.navBarRoute:
        return MaterialPageRoute(builder: (_) => NavBarScreen());
        case AppRoutes.aboutUsScreenRoute:
        return MaterialPageRoute(builder: (_) => AboutUsScreen());
      case AppRoutes.authRouter:
        return MaterialPageRoute(
          builder:
              (_) =>
                  BlocProvider(create: (_) => AuthCubit(), child: AuthScreen()),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(body: Center(child: Text('لا يوجد بيانات '))),
        );
    }
  }
}
