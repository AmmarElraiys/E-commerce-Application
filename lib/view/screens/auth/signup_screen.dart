import 'package:e_commerce_application/controller/auth/sign_up_controller.dart';
import 'package:e_commerce_application/core/utils/auth/email_validator.dart';
import 'package:e_commerce_application/core/utils/auth/password_validator.dart';
import 'package:e_commerce_application/core/utils/auth/pnone_number_validator.dart';
import 'package:e_commerce_application/core/utils/auth/username_validator.dart';
import 'package:e_commerce_application/view/widget/auth/button_login_signup_widget.dart';
import 'package:e_commerce_application/view/widget/auth/text_custom.dart';
import 'package:e_commerce_application/view/widget/auth/textbutton_login_signup_widget.dart';
import 'package:e_commerce_application/view/widget/auth/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Form(
                key: formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    SizedBox(height: 50),
                    TextCustom(
                      title: '18'.tr,
                      style: Theme.of(context).textTheme.headlineSmall!,
                    ),
                    TextCustom(
                      title: '19'.tr,
                      style: Theme.of(context).textTheme.bodyLarge!,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),

                    // Email & Password Fields
                    TextFormFieldWidget(
                      label: "20".tr,
                      icon: Icons.person,
                      controller: controller.controllerEmail,
                      iconColor: Colors.blue[200],
                      validator: UsernameValidator.validate,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormFieldWidget(
                      label: "12".tr,
                      icon: Icons.email,
                      controller: controller.controllerEmail,
                      iconColor: Colors.blue[200],
                      validator: EmailValidator.validate,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormFieldWidget(
                      label: "21".tr,
                      icon: Icons.phone,
                      controller: controller.controllerEmail,
                      iconColor: Colors.blue[200],
                      validator: PhoneValidator.validate,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormFieldWidget(
                      label: "13".tr,
                      icon: Icons.lock,
                      controller: controller.controllerPassword,
                      keyboardType: TextInputType.text,
                      validator: PasswordValidator.validate,
                      iconColor: Colors.blue[200],
                      initialObscureText: true,
                    ),
                    SizedBox(height: 20),
                    // Login & Google Login
                    ButtonLoginSignupWidget(
                      text: "18".tr,
                      onPressed: () {
                        controller.signUp();
                      },
                    ),

                    // Sign up link
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("22".tr),
                        TextbuttonLoginSignupWidget(
                          title: "11".tr,
                          onPressed: () {
                            controller.goToLogin();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
    );
  }
}
