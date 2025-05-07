import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  textTheme: TextTheme(
    headlineSmall: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppMyColor.black,
    ),
    headlineLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: AppMyColor.white,
    ),
    bodySmall: TextStyle(fontSize: 18, color: AppMyColor.grey100),
  ),
  primarySwatch: Colors.blue,
);
ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: TextTheme(
    headlineSmall: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppMyColor.black,
    ),
    headlineLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: AppMyColor.white,
    ),
    bodySmall: TextStyle(fontSize: 18, color: AppMyColor.grey100),
  ),
  primarySwatch: Colors.blue,
);
