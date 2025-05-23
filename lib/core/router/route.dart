import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/check-box/view-model/check_box_cubit.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/ui/view/forgot_password_screen.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/ui/view_model/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:mzaodina_app/feature/auth/login/ui/view-model/login_cubit/login_cubit.dart';
import 'package:mzaodina_app/feature/auth/login/ui/view/login_form_screen.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view/register_form_screen.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/country_cubit/country_cubit.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/register_cubit/register_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/ui/view/home_details_jaraa_screen.dart';
import 'package:mzaodina_app/feature/home/home_details/muntahi/data/model/muntahi_auctions_response.dart';
import 'package:mzaodina_app/feature/home/home_details/muntahi/ui/view/home_details_muntahi_screen.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/model/qadim_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view/home_details_qadim_screen.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view_model/register_to_auction_cubit/register_to_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/ui/view/home_details_sayantaliq_screen.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view_model/cubit/show_action_cubit.dart';
import 'package:mzaodina_app/feature/home/join-auction/view/join_the_auction.dart';
import 'package:mzaodina_app/feature/home/ui/view/home_screen.dart';
import 'package:mzaodina_app/feature/notifications/payment/Complete-shipping-information/view/complete_shipping_information_screen.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view/invoice_details_screen.dart';
import 'package:mzaodina_app/feature/notifications/ui/view/notifications_screen.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view/payment_details_screen.dart';
import 'package:mzaodina_app/feature/nav_bar/view/nav_bar.dart';
import 'package:mzaodina_app/feature/auth/ui/view-model/cubit/auth_cubit_cubit.dart';
import 'package:mzaodina_app/feature/auth/ui/view/auth_screen.dart';
import 'package:mzaodina_app/feature/nav_bar/view_model/nav_bar_cubit.dart';
import 'package:mzaodina_app/feature/profile/about-us/view/about_us_screen.dart';
import 'package:mzaodina_app/feature/profile/account-details/view/account_details_screen.dart';
import 'package:mzaodina_app/feature/profile/change-password/view/change_password_screen.dart';
import 'package:mzaodina_app/feature/profile/privacy-policy/view/privacy_policy_screen.dart';
import 'package:mzaodina_app/feature/profile/setting/view/setting_screen.dart';
import 'package:mzaodina_app/feature/profile/shipping&return-policy/view/shipping_and_return_policy_screen.dart';
import 'package:mzaodina_app/feature/profile/terms&conditions/view/terms_and_conditions_screen.dart';
import 'package:mzaodina_app/feature/profile/change-password/view_model/change_password_cubit/change_password_cubit.dart';
import 'package:mzaodina_app/feature/splash/splash_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splasahRouter:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.homeDetailsQadimScreenRoute:
        final args = settings.arguments as QadimAuction;
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) =>
                            getIt<ShowActionCubit>()..getShowAction(args.slug),
                  ),
                  BlocProvider(
                    create:
                        (context) =>
                            getIt<RegisterToAuctionCubit>()
                              ..registerToAuction(args.slug),
                  ),
                ],
                child: HomeDetailsQadimScreen(qadimDetails: args),
              ),
        );
      case AppRoutes.homeDetailsMuntahiScreenRoute:
        final args = settings.arguments as MuntahiAction;
        return MaterialPageRoute(
          builder: (_) => HomeDetailsMuntahiScreen(muntahiDetails: args),
        );
      case AppRoutes.homeDetailsJaraaScreenRoute:
        final args = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          builder:
              (_) => HomeDetailsJaraaScreen(
                eventTimeFromApi: args['eventTime']!,
                jaraaDetails: args['jaraaDataModel'],
              ),
        );
      case AppRoutes.homeDetailsSayantaliqScreenRoute:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => HomeDetailsSayantaliqScreen(
                eventTimeFromApi: args['eventTime']!,
                sayantaliqDetails: args['sayantaliqDataModel'],
              ),
        );
      case AppRoutes.navBarRoute:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => NavBarCubit(),
                child: NavBarScreen(),
              ),
        );
      case AppRoutes.aboutUsScreenRoute:
        return MaterialPageRoute(builder: (_) => AboutUsScreen());
      case AppRoutes.accountDetailsScreenRoute:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<CountryCubit>(
                create: (context) => CountryCubit(),

                child: AccountDetailsScreen(),
              ),
        );
      case AppRoutes.changePasswordScreenRoute:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<ChangePasswordCubit>(),
                child: ChangePasswordScreen(),
              ),
        );
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
      case AppRoutes.completeShippingInformationScreenRoute:
        return MaterialPageRoute(
          builder: (_) => CompleteShippingInformationScreen(),
        );
      case AppRoutes.shippingAndReturnPolicyScreenRoute:
        return MaterialPageRoute(
          builder: (_) => ShippingAndReturnPolicyScreen(),
        );
      case AppRoutes.joinTheAuction:
        return MaterialPageRoute(builder: (_) => JoinTheAuction());
      case AppRoutes.authRouter:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider<AuthCubit>(create: (_) => AuthCubit()),
                  BlocProvider(
                    create: (_) => getIt<LoginCubit>(),
                    child: LoginFormScreen(),
                  ),
                  BlocProvider(
                    create: (_) => getIt<RegisterCubit>(),
                    child: RegisterFormScreen(),
                  ),
                  BlocProvider<CountryCubit>(
                    create: (context) => CountryCubit(),
                  ),
                  BlocProvider(
                    create: (context) => CheckboxCubit(initialValue: false),
                  ),
                  BlocProvider(
                    create: (context) => getIt<ForgotPasswordCubit>(),
                    child: ForgotPasswordScreen(),
                  ),
                ],
                child: AuthScreen(),
              ),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(body: Center(child: Text('لا يوجد بيانات '))),
        );
    }
  }
}
