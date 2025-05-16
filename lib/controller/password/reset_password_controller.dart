import 'package:e_commerce_application/core/class/statusrequist.dart';
import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/core/functions/handlingdata.dart';
import 'package:e_commerce_application/data/datasource/remote/forgetpassword/resetpassword_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController controllerPassword;
  late TextEditingController controllerRePassword;
  StatusRequist statusRequist = StatusRequist.none;
  ResetpasswordData resetpasswordData = ResetpasswordData(Get.find());
  String? email;

  @override
  goToSuccessResetPassword() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (controllerPassword.text != controllerRePassword.text) {
        return Get.defaultDialog(
          title: "Warning ",
          middleText: "Password does not match",
        );
      }

      statusRequist = StatusRequist.loading;
      update();

      var response = await resetpasswordData.postData(
        email,
        controllerPassword.text,
      );
      statusRequist = handlingData(response);

      if (StatusRequist.success == statusRequist) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.successresetpass);
        } else {
          statusRequist = StatusRequist.failure;
          update();
        }
      }
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    controllerPassword = TextEditingController();
    controllerRePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    controllerPassword.dispose();
    controllerRePassword.dispose();
    super.dispose();
  }
}
