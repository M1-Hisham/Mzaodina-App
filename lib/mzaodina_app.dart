import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/router/route.dart';
import 'package:mzaodina_app/feature/auction/cubit/auction_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view/notifications_screen.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/get_notification_cubit/get_notification_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/mark_notification_cubit/mark_notification_cubit.dart';
import 'package:mzaodina_app/feature/profile/view_model/user_data_cubit/user_data_cubit.dart';
import 'package:mzaodina_app/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/web-socket/cubit/web_socket_cubit.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class MzaodinaApp extends StatelessWidget {
  const MzaodinaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WebSocketCubit>(create: (context) => WebSocketCubit()),
        BlocProvider(
          create:
              (context) =>
                  AuctionCubit()..auctionState(id: "7", state: "ready"),
        ),
        BlocProvider(create: (context) => getIt<MarkNotificationCubit>()),
        BlocProvider(
          create:
              (context) => getIt<GetNotificationCubit>()..fetchNotifications(1),
        ),
        BlocProvider(
          create: (context) => getIt<UserDataCubit>()..fetchUserData(),
        ),
      ],
      child: MaterialApp(
        navigatorObservers: [routeObserver],
        navigatorKey: navigatorKey,
        builder: (context, child) {
          ScreenUtil.init(
            context,
            designSize: const Size(402, 874),
            minTextAdapt: true,
            splitScreenMode: true,
          );
          ScreenUtil.enableScale(enableWH: () => true, enableText: () => true);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
        locale: const Locale('ar'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('ar')],
        title: 'Mzaodin',
        debugShowCheckedModeBanner: false,
        theme: R.themeData.themeLight,
        // home: NotificationsScreen(),
        initialRoute: AppRoutes.splasahRouter,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
