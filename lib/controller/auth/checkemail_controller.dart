import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class CheckemailController extends GetxController {
  checkemail();
  goToVerifiyCodeSignup();
}

class CheckemailControllerImp extends CheckemailController {
  late TextEditingController controllerEmail;
  @override
  checkemail() {}

  @override
  goToVerifiyCodeSignup() {
    Get.offNamed(AppRoutes.verifiycodesignup);
  }

  @override
  void onInit() {
    controllerEmail = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    super.dispose();
  }
}
