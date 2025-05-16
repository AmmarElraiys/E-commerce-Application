import 'package:e_commerce_application/controller/password/success_password_controller.dart';
import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/view/widget/auth/button_login_signup_widget.dart';
import 'package:e_commerce_application/view/widget/auth/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessPasswordControllerImp controller = Get.put(
      SuccessPasswordControllerImp(),
    );
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: ListView(
          children: [
            TextCustom(
              title: '28'.tr,
              style: Theme.of(context).textTheme.headlineSmall!,
            ),
            SizedBox(height: 50),
            Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppMyColor.primarycolor,
            ),
            TextCustom(
              title: '29'.tr,
              style: Theme.of(context).textTheme.headlineSmall!,
            ),
            TextCustom(
              title: '42'.tr,
              style: Theme.of(context).textTheme.headlineMedium!,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 150),
            SizedBox(
              width: double.infinity,
              child: ButtonLoginSignupWidget(
                text: "31".tr,
                onPressed: () {
                  controller.goToLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
