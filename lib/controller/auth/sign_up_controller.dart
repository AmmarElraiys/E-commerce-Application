import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController controllerUserName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPhone;
  late TextEditingController controllerPassword;
  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  signUp() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.offNamed(AppRoutes.verifiycodesignup);
    }
  }

  @override
  void onInit() {
    controllerUserName = TextEditingController();
    controllerEmail = TextEditingController();
    controllerPhone = TextEditingController();
    controllerPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    controllerUserName.dispose();
    controllerEmail.dispose();
    controllerPhone.dispose();
    controllerPassword.dispose();
  }
}
