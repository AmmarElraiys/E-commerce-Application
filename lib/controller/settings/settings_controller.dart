import 'package:e_commerce_application/core/constant/appthemedata.dart';
import 'package:e_commerce_application/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "en") {
      language = Locale("en");
      appTheme = themeEnglish;
    } else if (sharedPrefLang == "ar") {
      language = Locale("ar");
      appTheme = themeArabic;
    } else {
      appTheme = themeEnglish;
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
