import 'package:e_commerce_application/controller/home_controller.dart';
import 'package:e_commerce_application/view/widget/home/product_stack_widget.dart';
import 'package:e_commerce_application/view/widget/home/textformfield_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            TextformfieldSearchWidget(onTap: () {}, title: "Find Product"),
            SizedBox(height: 20),
            ProductStackWidget(
              title: "🔥 A Summer Surprise",
              subTitle: "Cashback 20%",
            ),
          ],
        ),
      ),
    );
  }
}
