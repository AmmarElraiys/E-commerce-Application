import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerifiycodeSignupController extends GetxController {
  checCode();
  goToSuccessSignUp();
}

class VerifiycodeSignupControllerImp extends VerifiycodeSignupController {
  late String verifiycode;
  @override
  checCode() {}

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successsignup);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
