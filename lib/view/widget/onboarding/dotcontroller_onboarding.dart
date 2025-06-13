import 'package:e_commerce_application/controller/onboarding_controller.dart';
import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotcontrollerOnboarding extends StatelessWidget {
  const DotcontrollerOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
      builder:
          (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: controller.pageIndex == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      controller.pageIndex == index
                          ? AppMyColor.primarycolor
                          // ignore: deprecated_member_use
                          : AppMyColor.primarycolor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
    );
  }
}
