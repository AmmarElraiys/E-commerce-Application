import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  checkemail();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController controllerPassword;
  late TextEditingController controllerRePassword;

  @override
  checkemail() {}

  goToSuccessResetPassword() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.offNamed(AppRoutes.successresetpass);
    }
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
