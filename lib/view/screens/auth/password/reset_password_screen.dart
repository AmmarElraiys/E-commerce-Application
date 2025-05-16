import 'package:e_commerce_application/controller/password/reset_password_controller.dart';
import 'package:e_commerce_application/core/class/handlingdataview.dart';
import 'package:e_commerce_application/core/constant/imageassets.dart';
import 'package:e_commerce_application/core/utils/auth/password_validator.dart';
import 'package:e_commerce_application/view/widget/auth/button_login_signup_widget.dart';
import 'package:e_commerce_application/view/widget/auth/logo_image.dart';
import 'package:e_commerce_application/view/widget/auth/text_custom.dart';
import 'package:e_commerce_application/view/widget/auth/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      body: GetBuilder<ResetPasswordControllerImp>(
        builder:
            (controller) => HandlingdataRequest(
              statusRequist: controller.statusRequist,
              widget: Form(
                key: controller.formstate,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                  child: ListView(
                    children: [
                      TextCustom(
                        title: "37".tr,
                        style: Theme.of(context).textTheme.headlineSmall!,
                      ),
                      LogoImage(image: AppImageassets.logoImage),
                      TextCustom(
                        title: "38".tr,
                        style: Theme.of(context).textTheme.headlineSmall!,
                      ),
                      TextCustom(
                        title: "39".tr,
                        style: Theme.of(context).textTheme.bodySmall!,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),

                      TextFormFieldWidget(
                        label: "38".tr,
                        icon: Icons.lock,
                        controller: controller.controllerPassword,
                        keyboardType: TextInputType.text,
                        validator: PasswordValidator.validate,
                        iconColor: Colors.blue[200],
                        initialObscureText: true,
                      ),
                      TextFormFieldWidget(
                        label: "40".tr,
                        icon: Icons.lock,
                        controller: controller.controllerRePassword,
                        keyboardType: TextInputType.text,
                        validator: PasswordValidator.validate,
                        iconColor: Colors.blue[200],
                        initialObscureText: true,
                      ),
                      SizedBox(height: 10),
                      ButtonLoginSignupWidget(
                        text: "41".tr,
                        onPressed: () {
                          controller.goToSuccessResetPassword();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
