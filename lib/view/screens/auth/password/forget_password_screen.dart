import 'package:e_commerce_application/controller/auth/password/forget_password_controller.dart';
import 'package:e_commerce_application/core/constant/imageassets.dart';
import 'package:e_commerce_application/core/utils/auth/email_validator.dart';
import 'package:e_commerce_application/view/widget/auth/button_login_signup_widget.dart';
import 'package:e_commerce_application/view/widget/auth/logo_image.dart';
import 'package:e_commerce_application/view/widget/auth/text_custom.dart';
import 'package:e_commerce_application/view/widget/auth/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller = Get.put(
      ForgetPasswordControllerImp(),
    );
    return Scaffold(
      body: Form(
        key: controller.formstate,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
          child: ListView(
            children: [
              TextCustom(
                title: "32".tr,
                style: Theme.of(context).textTheme.headlineSmall!,
              ),
              LogoImage(image: AppImageassets.logoImage),
              TextCustom(
                title: "24".tr,
                style: Theme.of(context).textTheme.headlineSmall!,
              ),
              TextCustom(
                title: "26".tr,
                style: Theme.of(context).textTheme.bodySmall!,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),

              TextFormFieldWidget(
                label: "12".tr,
                icon: Icons.email,
                controller: controller.controllerEmail,
                iconColor: Colors.blue[200],
                validator: EmailValidator.validate,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              ButtonLoginSignupWidget(
                text: "27".tr,
                onPressed: () {
                  controller.goToVerifiyCode();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
