import 'package:e_commerce_application/controller/test_controller.dart';
import 'package:e_commerce_application/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      body: GetBuilder<TestController>(
        builder: (controller) {
          return Handlingdataview(
            statusRequist: controller.statusRequist,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Text("${controller.data}");
              },
            ),
          );
        },
      ),
    );
  }
}
