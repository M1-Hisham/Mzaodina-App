import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class AppThemeData {
  final ThemeData themeLight = ThemeData(
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(seedColor: R.colors.primaryColorLight),
  );
  final ThemeData themeDark = ThemeData(
    primaryColor: R.colors.primaryColorLight,
    scaffoldBackgroundColor: R.colors.backgroundColorLight,
    hintColor: R.colors.hintTextColorLight,
  );
}
