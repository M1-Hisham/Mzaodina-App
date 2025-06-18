import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/check-box/view-model/check_box_cubit.dart';
import 'package:mzaodina_app/feature/auth/apple/view-model/apple_cubit/apple_cubit.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/ui/view/forgot_password_screen.dart';
import 'package:mzaodina_app/feature/auth/forgot-password/ui/view_model/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:mzaodina_app/feature/auth/google/view-model/google_cubit/google_cubit.dart';
import 'package:mzaodina_app/feature/auth/login/ui/view-model/login_cubit/login_cubit.dart';
import 'package:mzaodina_app/feature/auth/login/ui/view/login_form_screen.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view/register_form_screen.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/country_cubit/country_cubit.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/phone_code_cubit/phone_code_cubit.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/register_cubit/register_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view/home_details_ongoing_screen.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/auction_bidding_cubit/auction_bidding_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/auctions_bidding_history_cubit/auctions_bidding_history_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/ongoing_show_auction_cubit/ongoing_show_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/model/finished_auctions_response.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/ui/view/home_details_finished_screen.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/ui/view_model/finished_show_auction_cubit/finished_show_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/notstart_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view/home_details_notstart_screen.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/subscribe_auction-cubit/subscribe_auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view/home_details_ready_screen.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/notstart_show_auction_cubit/notstart_show_action_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view_model/ready_show_austion_cubit/ready_show_austion_cubit.dart';
import 'package:mzaodina_app/feature/home/join-auction/view/join_the_auction.dart';
import 'package:mzaodina_app/feature/home/ui/view/home_screen.dart';
import 'package:mzaodina_app/feature/notifications/payment/Complete-shipping-information/view/complete_shipping_information_screen.dart';
import 'package:mzaodina_app/feature/notifications/payment/data/model/last_invoice_model.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view/invoice_details_screen.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view_model/Last_invoice_cubit/last_invoice_cubit.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view_model/payment_invoice_cubit/payment_invoice_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view/notifications_screen.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view/payment_details_screen.dart';
import 'package:mzaodina_app/feature/nav_bar/view/nav_bar.dart';
import 'package:mzaodina_app/feature/auth/ui/view-model/cubit/auth_cubit_cubit.dart';
import 'package:mzaodina_app/feature/auth/ui/view/auth_screen.dart';
import 'package:mzaodina_app/feature/nav_bar/view_model/nav_bar_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/get_notification_cubit/get_notification_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/mark_notification_cubit/mark_notification_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/save_token_cubit/save_token_cubit.dart';
import 'package:mzaodina_app/feature/profile/about-us/view/about_us_screen.dart';
import 'package:mzaodina_app/feature/profile/account-details/view/account_details_screen.dart';
import 'package:mzaodina_app/feature/profile/account-details/view_model/update_profile_cubit/update_profile_cubit.dart';
import 'package:mzaodina_app/feature/profile/change-password/view/change_password_screen.dart';
import 'package:mzaodina_app/feature/profile/data/model/user_model.dart';
import 'package:mzaodina_app/feature/profile/privacy-policy/view/privacy_policy_screen.dart';
import 'package:mzaodina_app/feature/profile/setting/view/setting_screen.dart';
import 'package:mzaodina_app/feature/profile/shipping&return-policy/view/shipping_and_return_policy_screen.dart';
import 'package:mzaodina_app/feature/profile/terms&conditions/view/terms_and_conditions_screen.dart';
import 'package:mzaodina_app/feature/profile/change-password/view_model/change_password_cubit/change_password_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/about_us_cubit/about_us_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/privacy_cubit/privacy_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/shipping_cubit/shipping_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/terms_cubit/terms_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/user_data_cubit/user_data_cubit.dart';
import 'package:mzaodina_app/feature/splash/splash_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splasahRouter:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.homeDetailsNotstartScreenRoute:
        final args = settings.arguments as NotstartAuction;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        getIt<NotstartShowActionCubit>()
                          ..getShowAction(args.slug),

                child: HomeDetailsNotstartScreen(notstartDetails: args),
              ),
        );
      case AppRoutes.homeDetailsFinishedScreenRoute:
        final args = settings.arguments as FinishedAction;
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) =>
                            getIt<FinishedShowAuctionCubit>()
                              ..getFinishedShowAuction(args.slug),
                  ),
                  BlocProvider(
                    create:
                        (context) =>
                            getIt<AuctionsBiddingHistoryCubit>()
                              ..getAuctionsBiddingHistory(args.slug),
                  ),
                ],
                child: HomeDetailsFinishedScreen(finishedDetails: args),
              ),
        );

      case AppRoutes.homeDetailsOngoingScreenRoute:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) =>
                            getIt<OngoingShowAuctionCubit>()
                              ..getOngoingShowAuctionCubit(
                                args['ongoingDataModel'].slug,
                              ),
                  ),
                  BlocProvider(
                    create:
                        (context) =>
                            getIt<AuctionsBiddingHistoryCubit>()
                              ..getAuctionsBiddingHistory(
                                args['ongoingDataModel'].slug,
                              ),
                  ),
                  BlocProvider(
                    create: (context) => getIt<AuctionBiddingCubit>(),
                  ),
                ],
                child: HomeDetailsOngoingScreen(
                  endAt: args['endAt']!,
                  ongoingDetails: args['ongoingDataModel'],
                ),
              ),
        );

      /// Home Details Ready Screen
      case AppRoutes.homeDetailsReadyScreenRoute:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) =>
                            getIt<ReadyShowAustionCubit>()
                              ..getReadyShowAuctionCubit(
                                args['sayantaliqDataModel'].slug,
                              ),
                  ),
                ],
                child: HomeDetailsReadyScreen(
                  startAt: args['startAt']!,
                  readyDetails: args['sayantaliqDataModel'],
                  s: args['s'] ?? 0,
                  m: args['m'] ?? 0,
                  h: args['h'] ?? 0,
                  d: args['d'] ?? 0,
                ),
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
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<AboutUsCubit>()..getAboutUs(),
                child: AboutUsScreen(),
              ),
        );
      case AppRoutes.accountDetailsScreenRoute:
        final args = settings.arguments as UserData;
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider<CountryCubit>(
                    create: (context) => CountryCubit(),
                  ),
                  BlocProvider<PhoneCodeCubit>(
                    create:
                        (context) =>
                            PhoneCodeCubit()..updatePhoneCode('🇸🇦', '+966'),
                  ),

                  BlocProvider(
                    create: (context) => getIt<UpdateProfileCubit>(),
                  ),

                  BlocProvider.value(value: getIt<UserDataCubit>()),
                ],
                child: AccountDetailsScreen(), //userData: args),
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
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<TermsCubit>()..getTerms(),
                child: TermsAndConditionsScreen(),
              ),
        );
      case AppRoutes.privacyPolicyScreenRoute:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<PrivacyCubit>()..getPrivacy(),
                child: PrivacyPolicyScreen(),
              ),
        );
      case AppRoutes.settingScreenRoute:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case AppRoutes.notificationsScreenRoute:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: getIt<GetNotificationCubit>()..fetchNotifications(1),
                  ),
                  BlocProvider.value(value: getIt<MarkNotificationCubit>()),
                ],
                child: NotificationsScreen(),
              ),
        );
      case AppRoutes.invoiceDetailsScreenRoute:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        getIt<LastInvoiceCubit>()..lastInvoiceChecker(),
                child: InvoiceDetailsScreen(),
              ),
        );
      case AppRoutes.paymentDetailsScreenRoute:
        final args = settings.arguments as LastInvoiceData;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<PaymentInvoiceCubit>(),

                child: PaymentDetailsScreen(lastInvoiceData: args),
              ),
        );
      case AppRoutes.completeShippingInformationScreenRoute:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => CountryCubit()),
                  BlocProvider(create: (context) => PhoneCodeCubit()),
                  BlocProvider.value(value: getIt<UserDataCubit>()),
                  BlocProvider(
                    create: (context) => getIt<UpdateProfileCubit>(),
                  ),
                ],
                child: CompleteShippingInformationScreen(),
              ),
        );
      case AppRoutes.shippingAndReturnPolicyScreenRoute:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) => getIt<ShippingCubit>()..getShippingAndReturn(),
                child: ShippingAndReturnPolicyScreen(),
              ),
        );
      case AppRoutes.joinTheAuction:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => getIt<SubscribeAuctionCubit>(),
                  ),
                  BlocProvider(
                    create: (context) => getIt<NotstartShowActionCubit>(),
                  ),
                  BlocProvider(
                    create: (context) => CheckboxCubit(initialValue: false),
                  ),
                ],
                child: JoinTheAuction(
                  requiredBidders: args['requiredBidders'],
                  openingAmount: args['openingAmount'],
                  registrationAmount: args['registrationAmount'],
                  auctionId: args['auctionId'],
                  slug: args['slug'],
                  auctionStartRate: args['auctionStartRate'],
                  currentBidders: args['currentBidders'],
                ),
              ),
        );
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
                  BlocProvider(create: (context) => getIt<AppleCubit>()),
                  BlocProvider(create: (context) => getIt<GoogleCubit>()),
                  BlocProvider(
                    create: (_) => getIt<RegisterCubit>(),
                    child: RegisterFormScreen(),
                  ),
                  BlocProvider<CountryCubit>(
                    create: (context) => CountryCubit(),
                  ),
                  BlocProvider<PhoneCodeCubit>(
                    create:
                        (context) =>
                            PhoneCodeCubit()..updatePhoneCode('🇸🇦', '+966'),
                  ),
                  BlocProvider<SaveTokenCubit>(
                    create: (context) => getIt<SaveTokenCubit>(),
                  ),
                  BlocProvider.value(value: getIt<UserDataCubit>()),
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
