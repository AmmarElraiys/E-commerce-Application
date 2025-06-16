import 'package:e_commerce_application/core/constant/appthemedata.dart';
import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;
  goToLogin() async {
    // Mevcut dili geçici olarak al
    String? lang = myServices.sharedPreferences.getString("lang");

    // Tüm verileri sil
    await myServices.sharedPreferences.clear();

    // Dili tekrar geri yaz
    if (lang != null) {
      await myServices.sharedPreferences.setString("lang", lang);
    }

    Get.offAllNamed(AppRoutes.login);
  }

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    // String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    // if (sharedPrefLang == "en") {
    //   language = Locale("en");
    //   appTheme = themeEnglish;
    // } else if (sharedPrefLang == "ar") {
    //   language = Locale("ar");
    //   appTheme = themeArabic;
    // } else {
    //   appTheme = themeEnglish;
    //   language = Locale(Get.deviceLocale!.languageCode);
    // }
    super.onInit();
  }
}
