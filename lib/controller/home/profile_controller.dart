import 'package:e_commerce_application/core/services/services.dart';
import 'package:get/get.dart';

abstract class ProfileController extends GetxController {
  intialData();
}

class ProfileControllerImp extends ProfileController {
  MyServices myServices = Get.find();
  String? id;
  String? email;
  String? phone;
  String? username;
  @override
  intialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    email = myServices.sharedPreferences.getString("email");
    phone = myServices.sharedPreferences.getString("phone");
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
