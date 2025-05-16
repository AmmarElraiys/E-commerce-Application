import 'package:e_commerce_application/controller/auth/login_controller.dart';
import 'package:e_commerce_application/core/class/handlingdataview.dart';
import 'package:e_commerce_application/core/constant/imageassets.dart';
import 'package:e_commerce_application/core/functions/alertexitapp.dart';
import 'package:e_commerce_application/core/utils/auth/email_validator.dart';
import 'package:e_commerce_application/core/utils/auth/password_validator.dart';
import 'package:e_commerce_application/view/widget/auth/button_login_signup_widget.dart';
import 'package:e_commerce_application/view/widget/auth/logo_image.dart';
import 'package:e_commerce_application/view/widget/auth/text_custom.dart';
import 'package:e_commerce_application/view/widget/auth/textbutton_login_signup_widget.dart';
import 'package:e_commerce_application/view/widget/auth/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder:
              (controller) => HandlingdataRequest(
                statusRequist: controller.statusRequist,
                widget: Form(
                  key: controller.formstate,
                  child: ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      SizedBox(height: 40),
                      LogoImage(image: AppImageassets.logoImage),
                      TextCustom(
                        title: '10'.tr,
                        style: Theme.of(context).textTheme.headlineSmall!,
                      ),
                      TextCustom(
                        title: '11'.tr,
                        style: Theme.of(context).textTheme.headlineSmall!,
                      ),

                      SizedBox(height: 50),

                      // Email & Password Fields
                      TextFormFieldWidget(
                        label: "12".tr,
                        icon: Icons.email,
                        controller: controller.controllerLoginEmail,
                        iconColor: Colors.blue[200],
                        validator: EmailValidator.validate,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormFieldWidget(
                        label: "13".tr,
                        icon: Icons.lock,
                        controller: controller.controllerLoginPassword,
                        keyboardType: TextInputType.text,
                        validator: PasswordValidator.validate,
                        iconColor: Colors.blue[200],
                        initialObscureText: true,
                      ),

                      // Forget password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextbuttonLoginSignupWidget(
                          title: "14".tr,
                          onPressed: () {
                            controller.goToForgetPassword();
                          },
                        ),
                      ),

                      // Login & Google Login
                      ButtonLoginSignupWidget(
                        text: "15".tr,
                        onPressed: () {
                          controller.login();
                        },
                      ),
                      SizedBox(height: 16),
                      ButtonLoginSignupWidget(
                        text: "16".tr,
                        onPressed: () {},
                        icon: Image.asset(
                          AppImageassets.googleImage,
                          width: 20,
                          height: 20,
                        ),
                      ),

                      // Sign up link
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("17".tr),
                          TextbuttonLoginSignupWidget(
                            title: "18".tr,
                            onPressed: () {
                              controller.goToSignUp();
                            },
                          ),
                        ],
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
