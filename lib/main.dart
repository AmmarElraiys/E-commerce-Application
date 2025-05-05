import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/routes.dart';
import 'package:e_commerce_application/view/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme: TextTheme(
          headlineSmall: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          bodySmall: TextStyle(fontSize: 18, color: AppMyColor.grey100),
        ),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const OnBoardingScreen(),
      routes: routes,
    );
  }
}
