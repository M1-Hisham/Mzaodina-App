import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/feature/home/ui/view/home_details_screen.dart';
import 'package:mzaodina_app/feature/home/ui/view/home_screen.dart';
import 'package:mzaodina_app/feature/home/ui/view/invoice_details_screen.dart';
import 'package:mzaodina_app/feature/home/ui/view/notifications_screen.dart';
import 'package:mzaodina_app/feature/home/ui/view/payment_details_screen.dart';
import 'package:mzaodina_app/feature/nav_bar/view/nav_bar.dart';
import 'package:mzaodina_app/feature/auth/ui/view-model/cubit/auth_cubit_cubit.dart';
import 'package:mzaodina_app/feature/auth/ui/view/auth_screen.dart';
import 'package:mzaodina_app/feature/profile/about-us/view/about_us_screen.dart';
import 'package:mzaodina_app/feature/profile/account-details/view/account_details_screen.dart';
import 'package:mzaodina_app/feature/profile/change-password/view/change_password_screen.dart';
import 'package:mzaodina_app/feature/profile/privacy-policy/view/privacy_policy_screen.dart';
import 'package:mzaodina_app/feature/profile/setting/view/setting_screen.dart';
import 'package:mzaodina_app/feature/profile/shipping&return-policy/view/shipping_and_return_policy_screen.dart';
import 'package:mzaodina_app/feature/profile/terms&conditions/view/terms_and_conditions_screen.dart';
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
      case AppRoutes.accountDetailsScreenRoute:
        return MaterialPageRoute(builder: (_) => AccountDetailsScreen());
      case AppRoutes.changePasswordScreenRoute:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
      case AppRoutes.termsAndConditionsScreenRoute:
        return MaterialPageRoute(builder: (_) => TermsAndConditionsScreen());
      case AppRoutes.privacyPolicyScreenRoute:
        return MaterialPageRoute(builder: (_) => PrivacyPolicyScreen());
      case AppRoutes.settingScreenRoute:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case AppRoutes.notificationsScreenRoute:
        return MaterialPageRoute(builder: (_) => NotificationsScreen());
      case AppRoutes.invoiceDetailsScreenRoute:
        return MaterialPageRoute(builder: (_) => InvoiceDetailsScreen());
      case AppRoutes.paymentDetailsScreenRoute:
        return MaterialPageRoute(builder: (_) => PaymentDetailsScreen());
      case AppRoutes.shippingAndReturnPolicyScreenRoute:
        return MaterialPageRoute(
          builder: (_) => ShippingAndReturnPolicyScreen(),
        );
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
