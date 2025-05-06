import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/core/localization/changelocal.dart';
import 'package:e_commerce_application/view/widget/onboarding/buttoncostum_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<ChangelocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 20),
            ButtoncostumOnboarding(
              title: "2".tr,
              style: Theme.of(context).textTheme.headlineLarge,
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
            SizedBox(height: 20),
            ButtoncostumOnboarding(
              title: "3".tr,
              style: Theme.of(context).textTheme.headlineLarge,
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
