import 'package:e_commerce_application/controller/onboarding_controller.dart';
import 'package:e_commerce_application/view/widget/onboarding/buttoncostum_onboarding.dart';
import 'package:e_commerce_application/view/widget/onboarding/custom_slider_onboarding.dart';
import 'package:e_commerce_application/view/widget/onboarding/dotcontroller_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingControllerImp controller = Get.put(OnboardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(flex: 8, child: CustomSliderOnboarding()),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                DotcontrollerOnboarding(),
                SizedBox(height: 15),
                ButtoncostumOnboarding(
                  title: "23".tr,
                  onPressed: () {
                    controller.next();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
