import 'package:e_commerce_application/core/class/statusrequist.dart';
import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/core/functions/handlingdata.dart';
import 'package:e_commerce_application/data/datasource/remote/auth/login_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController controllerLoginEmail;
  late TextEditingController controllerLoginPassword;
  StatusRequist statusRequist = StatusRequist.none;
  LoginData loginData = LoginData(Get.find());

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoutes.forgetpass);
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequist = StatusRequist.loading;
      update();
      var response = await loginData.postData(
        controllerLoginEmail.text,
        controllerLoginPassword.text,
      );
      statusRequist = handlingData(response);
      if (StatusRequist.success == statusRequist) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.home);
          // data.addAll(response);
        } else {
          Get.defaultDialog(
            title: "Warning ",
            middleText: "Incorrect email or password",
          );
          statusRequist = StatusRequist.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    controllerLoginEmail = TextEditingController();
    controllerLoginPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    controllerLoginEmail.dispose();
    controllerLoginPassword.dispose();
  }
}
