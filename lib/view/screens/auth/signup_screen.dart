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
                      title: 'Sign Up',
                      style: Theme.of(context).textTheme.headlineSmall!,
                    ),
                    TextCustom(
                      title:
                          'Welcome to our e-commerce application.We’re glad to have you with us.Have a great day!',
                      style: Theme.of(context).textTheme.bodyLarge!,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),

                    // Email & Password Fields
                    TextFormFieldWidget(
                      label: "UserName",
                      icon: Icons.person,
                      controller: controller.controllerEmail,
                      iconColor: Colors.blue[200],
                      validator: UsernameValidator.validate,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormFieldWidget(
                      label: "Email",
                      icon: Icons.email,
                      controller: controller.controllerEmail,
                      iconColor: Colors.blue[200],
                      validator: EmailValidator.validate,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormFieldWidget(
                      label: "Phone",
                      icon: Icons.phone,
                      controller: controller.controllerEmail,
                      iconColor: Colors.blue[200],
                      validator: PhoneValidator.validate,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormFieldWidget(
                      label: "Password",
                      icon: Icons.lock,
                      controller: controller.controllerPassword,
                      keyboardType: TextInputType.text,
                      validator: PasswordValidator.validate,
                      iconColor: Colors.blue[200],
                      initialObscureText: true,
                    ),

                    // Forget password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextbuttonLoginSignupWidget(
                        title: "Forget Password?",
                        onPressed: () {},
                      ),
                    ),

                    // Login & Google Login
                    ButtonLoginSignupWidget(text: "Sign Up", onPressed: () {}),

                    // Sign up link
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("I already have an account! "),
                        TextbuttonLoginSignupWidget(
                          title: "Sign In",
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
