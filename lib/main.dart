import 'package:e_commerce_application/binding.dart';
import 'package:e_commerce_application/core/localization/changelocal.dart';
import 'package:e_commerce_application/core/localization/translation.dart';
import 'package:e_commerce_application/core/services/services.dart';
import 'package:e_commerce_application/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ChangelocalController controller = Get.put(ChangelocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      initialBinding: MyBindings(),
      theme: controller.appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      getPages: routes,
    );
  }
}
