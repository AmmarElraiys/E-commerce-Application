import 'package:e_commerce_application/controller/onboarding_controller.dart';
import 'package:e_commerce_application/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomSliderOnboarding extends GetView<OnboardingControllerImp> {
  const CustomSliderOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        final screen = onBoardingList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 110),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                screen.title!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Image.asset(
                screen.image!,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.contain,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  screen.body!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
