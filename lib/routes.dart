import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/view/screens/auth/login_screen.dart';
import 'package:e_commerce_application/view/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (context) => const LoginScreen(),
  AppRoutes.onBoarding: (context) => const OnBoardingScreen(),
};
