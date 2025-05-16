import 'package:e_commerce_application/core/class/statusrequist.dart';
import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/core/functions/handlingdata.dart';
import 'package:e_commerce_application/data/datasource/remote/forgetpassword/checkemail_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController controllerEmail;
  StatusRequist statusRequist = StatusRequist.none;
  List data = [];
  ChecEmailkData checEmailkData = ChecEmailkData(Get.find());

  @override
  checkemail() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequist = StatusRequist.loading;
      update();
      var response = await checEmailkData.postData(controllerEmail.text);
      statusRequist = handlingData(response);
      if (StatusRequist.success == statusRequist) {
        if (response['status'] == "success") {
          Get.offNamed(
            AppRoutes.resetpass,
            arguments: {"email": controllerEmail.text},
          );
        } else {
          Get.defaultDialog(title: "Warning ", middleText: "Incorrect Email ");
          statusRequist = StatusRequist.failure;
        }
      }
    }
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
