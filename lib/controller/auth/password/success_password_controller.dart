import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessPasswordController extends GetxController {
  goToLogin();
}

class SuccessPasswordControllerImp extends SuccessPasswordController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
