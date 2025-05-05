import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/data/datasource/static/static.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnboardingControllerImp extends OnboardingController {
  late PageController pageController;
  int pageIndex = 0;

  @override
  next() {
    pageIndex++;
    if (pageIndex > onBoardingList.length - 1) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(
        pageIndex,
        duration: Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    pageIndex = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
