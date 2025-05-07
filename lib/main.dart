import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/core/localization/changelocal.dart';
import 'package:e_commerce_application/core/localization/translation.dart';
import 'package:e_commerce_application/core/services/services.dart';
import 'package:e_commerce_application/routes.dart';
import 'package:e_commerce_application/view/screens/language.dart';
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
      theme: ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme: TextTheme(
          headlineSmall: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppMyColor.black,
          ),
          headlineLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppMyColor.white,
          ),
          bodySmall: TextStyle(fontSize: 18, color: AppMyColor.grey100),
        ),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const Language(),
      routes: routes,
    );
  }
}
