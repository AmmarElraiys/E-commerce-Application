import 'package:e_commerce_application/controller/auth/sign_up_controller.dart';
import 'package:e_commerce_application/core/class/crud.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());

    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
  }
}
