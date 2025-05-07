import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController controllerLoginEmail;
  late TextEditingController controllerLoginPassword;
  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoutes.forgetpass);
  }

  @override
  login() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {}
  }

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
