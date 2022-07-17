import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(

  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'Jannah',
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: colorText,
    ),
    subtitle1: TextStyle(
      fontFamily: 'Jannah',
      fontSize: 14.0,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: colorText,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: colorPrimary,
      elevation: 20.0),
  scaffoldBackgroundColor: colorPrimary,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',
      color: colorText,
      fontWeight: FontWeight.w600,
      fontSize: 20.0,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: colorPrimaryDark,
      statusBarBrightness: Brightness.dark,
    ),
    color: colorPrimary,
    elevation: 0.0,
  ),
);
