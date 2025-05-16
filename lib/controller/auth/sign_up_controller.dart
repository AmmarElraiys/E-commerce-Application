import 'package:e_commerce_application/core/class/statusrequist.dart';
import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/core/functions/handlingdata.dart';
import 'package:e_commerce_application/data/datasource/remote/auth/signup_data.dart';
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
  SignupData signupData = SignupData(Get.find());
  StatusRequist statusRequist = StatusRequist.none;
  List data = [];
  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequist = StatusRequist.loading;
      update();
      var response = await signupData.postdata(
        controllerUserName.text,
        controllerEmail.text,
        controllerPhone.text,
        controllerPassword.text,
      );
      statusRequist = handlingData(response);
      if (StatusRequist.success == statusRequist) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.verifiycodesignup);
          data.addAll(response);
        } else {
          Get.defaultDialog(
            title: "Warning ",
            middleText: "Phone Number Or Email Already Exists",
          );
          statusRequist = StatusRequist.failure;
        }
      }
      update();
    } else {}
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
