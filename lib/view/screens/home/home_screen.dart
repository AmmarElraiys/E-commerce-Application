import 'package:e_commerce_application/controller/home/home_screen_controller.dart';
import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/view/widget/home/bottomnavigatonbar_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder:
          (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppMyColor.primarycolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),

              elevation: 5,
              onPressed: () {},
              child: Icon(Icons.shopping_bag_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomnavigatonbarHome(),
            body: controller.listPage.elementAt(controller.currentPage),
          ),
    );
  }
}
