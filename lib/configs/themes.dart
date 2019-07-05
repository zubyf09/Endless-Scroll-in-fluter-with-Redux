import 'package:flutter/material.dart';
import 'package:upday_assignment/constants/assets.dart';
import 'package:upday_assignment/constants/app_color.dart';


enum Themes {
  light,
  dark,
}

ThemeData getThemeByType(Themes type) {
  switch (type) {
    case Themes.dark:
      return ThemeData(
        brightness: Brightness.light,
      );
    default:
      return ThemeData(
        brightness: Brightness.light,
        fontFamily: Assets.fontFamily,
      );
  }
}


