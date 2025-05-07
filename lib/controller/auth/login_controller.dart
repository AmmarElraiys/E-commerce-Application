import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController controllerLoginEmail;
  late TextEditingController controllerLoginPassword;
  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetpass);
  }

  @override
  login() {}
  @override
  void onInit() {
    controllerLoginEmail = TextEditingController();
    controllerLoginPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    controllerLoginEmail.dispose();
    controllerLoginPassword.dispose();
  }
}
