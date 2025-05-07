import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
  goToVerifiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController controllerEmail;
  @override
  checkemail() {}

  @override
  goToVerifiyCode() {
    Get.offNamed(AppRoutes.verifiycode);
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
