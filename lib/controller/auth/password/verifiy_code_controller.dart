import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerifiyCodeController extends GetxController {
  checCode();
  goToResetPassword();
}

class VerifiyCodeControllerImp extends VerifiyCodeController {
  late String verifiycode;
  @override
  checCode() {}

  @override
  goToResetPassword() {
    Get.offNamed(AppRoutes.resetpass);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
