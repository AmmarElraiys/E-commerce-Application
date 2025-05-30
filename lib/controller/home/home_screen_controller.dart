import 'package:e_commerce_application/view/screens/categories/categories_screen.dart';
import 'package:e_commerce_application/view/screens/home/home.dart';
import 'package:e_commerce_application/view/screens/home/profile/profile_screen.dart';
import 'package:e_commerce_application/view/screens/home/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> listPage = [
    HomePage(),
    CategoriesScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];
  List titlelistPage = ["Home", "categories", "settings", "profile"];
  List<IconData> iconListPage = [
    Icons.home,
    Icons.category,
    Icons.settings,
    Icons.person,
  ];

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
