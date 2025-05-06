import 'package:e_commerce_application/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangelocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "en") {
      language = Locale("en");
    } else if (sharedPrefLang == "ar") {
      language = Locale("ar");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
