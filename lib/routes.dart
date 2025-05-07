import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/view/screens/auth/chceckemail_screen.dart';
import 'package:e_commerce_application/view/screens/auth/password/forget_password_screen.dart';
import 'package:e_commerce_application/view/screens/auth/login_screen.dart';
import 'package:e_commerce_application/view/screens/auth/password/reset_password_screen.dart';
import 'package:e_commerce_application/view/screens/auth/password/success_reset_password_screen.dart';
import 'package:e_commerce_application/view/screens/auth/signup_screen.dart';
import 'package:e_commerce_application/view/screens/auth/password/verifiycode_screen.dart';
import 'package:e_commerce_application/view/screens/auth/success_signup_screen.dart';
import 'package:e_commerce_application/view/screens/auth/verifiycode_signup_screen.dart';
import 'package:e_commerce_application/view/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (context) => const LoginScreen(),
  AppRoutes.onBoarding: (context) => const OnBoardingScreen(),
  AppRoutes.signup: (context) => const SignupScreen(),
  AppRoutes.forgetpass: (context) => const ForgetPasswordScreen(),
  AppRoutes.verifiycode: (context) => const VerifiycodeScreen(),
  AppRoutes.resetpass: (context) => const ResetPasswordScreen(),
  AppRoutes.successresetpass: (context) => const SuccessResetPassword(),
  AppRoutes.successsignup: (context) => const SuccessSignup(),
  AppRoutes.checkemail: (context) => const CheckEmailScreen(),
  AppRoutes.verifiycodesignup: (context) => const VerifiycodeSignupScreen(),
};
