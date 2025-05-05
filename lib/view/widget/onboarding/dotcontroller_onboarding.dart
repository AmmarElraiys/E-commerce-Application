import 'package:e_commerce_application/controller/onboarding_controller.dart';
import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DotcontrollerOnboarding extends StatelessWidget {
  const DotcontrollerOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
      builder:
          (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                onBoardingList.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 900),
                  width: controller.pageIndex == index ? 20 : 5,

                  height: 6,
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    color: AppMyColor.primarycolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
