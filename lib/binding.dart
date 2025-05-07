import 'package:e_commerce_application/controller/auth/sign_up_controller.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
  }
}
