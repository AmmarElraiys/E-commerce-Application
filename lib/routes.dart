import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/core/middleware/mymiddleware.dart';
// import 'package:e_commerce_application/test_view.dart';
// import 'package:e_commerce_application/test.dart';
import 'package:e_commerce_application/view/screens/auth/password/forget_password_screen.dart';
import 'package:e_commerce_application/view/screens/auth/login_screen.dart';
import 'package:e_commerce_application/view/screens/auth/password/reset_password_screen.dart';
import 'package:e_commerce_application/view/screens/auth/password/success_reset_password_screen.dart';
import 'package:e_commerce_application/view/screens/auth/signup_screen.dart';
import 'package:e_commerce_application/view/screens/auth/password/verifiycode_screen.dart';
import 'package:e_commerce_application/view/screens/auth/success_signup_screen.dart';
import 'package:e_commerce_application/view/screens/auth/verifiycode_signup_screen.dart';
import 'package:e_commerce_application/view/screens/home/home_screen.dart';
import 'package:e_commerce_application/view/screens/items_screen.dart';
import 'package:e_commerce_application/view/screens/language.dart';
import 'package:e_commerce_application/view/screens/myfavorite_screen.dart';
import 'package:e_commerce_application/view/screens/on_boarding_screen.dart';
import 'package:e_commerce_application/view/screens/product_details_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [Mymiddleware()],
  ),
  // GetPage(name: "/", page: () => const ProductDetailsScreen()),
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoardingScreen()),
  GetPage(name: AppRoutes.signup, page: () => const SignupScreen()),
  GetPage(name: AppRoutes.forgetpass, page: () => const ForgetPasswordScreen()),
  GetPage(name: AppRoutes.verifiycode, page: () => const VerifiycodeScreen()),
  GetPage(name: AppRoutes.resetpass, page: () => const ResetPasswordScreen()),
  GetPage(
    name: AppRoutes.successresetpass,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(name: AppRoutes.successsignup, page: () => const SuccessSignup()),
  GetPage(
    name: AppRoutes.verifiycodesignup,
    page: () => const VerifiycodeSignupScreen(),
  ),
  GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.itemsscreen, page: () => const ItemsScreen()),

  GetPage(
    name: AppRoutes.productdetails,
    page: () => const ProductDetailsScreen(),
  ),
  GetPage(name: AppRoutes.myfavorite, page: () => const MyfavoriteScreen()),
];
