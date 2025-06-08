// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mzaodina_app/core/resources/resources.dart';
// import 'package:mzaodina_app/core/router/app_routes.dart';
// import 'package:mzaodina_app/core/router/route.dart';
// import 'package:mzaodina_app/main.dart';

// final RouteObserver<ModalRoute<void>> routeObserver =
//     RouteObserver<ModalRoute<void>>();

// class MzaodinaApp extends StatelessWidget {
//   const MzaodinaApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorObservers: [routeObserver],
//       navigatorKey: navigatorKey,
//       builder: (context, child) {
//         ScreenUtil.init(
//           context,
//           designSize: const Size(402, 874),
//           minTextAdapt: true,
//           splitScreenMode: true,
//         );
//         ScreenUtil.enableScale(enableWH: () => true, enableText: () => true);
//         return Directionality(textDirection: TextDirection.rtl, child: child!);
//       },
//       locale: const Locale('ar'),
//       localizationsDelegates: [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: [Locale('ar')],
//       title: 'Mzaodina',
//       debugShowCheckedModeBanner: false,
//       theme: R.themeData.themeLight,
//       initialRoute: AppRoutes.splasahRouter,
//       onGenerateRoute: AppRouter.generateRoute,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/router/route.dart';
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
        title: 'Mzaodina',
        debugShowCheckedModeBanner: false,
        theme: R.themeData.themeLight,
        initialRoute: AppRoutes.splasahRouter,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
