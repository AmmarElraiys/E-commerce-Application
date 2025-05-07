import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  checkemail();
  goToVerifiyCode();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController controllerPassword;
  late TextEditingController controllerRePassword;

  @override
  checkemail() {}

  @override
  goToVerifiyCode() {
    Get.offNamed(AppRoutes.verifiycode);
  }

  goToSuccessResetPassword() {
    Get.offNamed(AppRoutes.successresetpass);
  }

  @override
  void onInit() {
    controllerPassword = TextEditingController();
    controllerRePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    controllerPassword.dispose();
    controllerRePassword.dispose();
    super.dispose();
  }
}
