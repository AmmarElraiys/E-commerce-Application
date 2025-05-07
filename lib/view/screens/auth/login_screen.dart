import 'package:e_commerce_application/controller/auth/login_controller.dart';
import 'package:e_commerce_application/core/constant/imageassets.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Form(
                key: formKey,
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    SizedBox(height: 40),
                    LogoImage(image: AppImageassets.logoImage),
                    TextCustom(
                      title: 'welecome back',
                      style: Theme.of(context).textTheme.headlineSmall!,
                    ),
                    TextCustom(
                      title: 'Sign In ',
                      style: Theme.of(context).textTheme.headlineSmall!,
                    ),

                    SizedBox(height: 50),

                    // Email & Password Fields
                    TextFormFieldWidget(
                      label: "Email",
                      icon: Icons.email,
                      controller: controller.controllerLoginEmail,
                      iconColor: Colors.blue[200],
                      validator: EmailValidator.validate,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormFieldWidget(
                      label: "Password",
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
                        title: "Forget Password?",
                        onPressed: () {},
                      ),
                    ),

                    // Login & Google Login
                    ButtonLoginSignupWidget(text: "Login", onPressed: () {}),
                    SizedBox(height: 16),
                    ButtonLoginSignupWidget(
                      text: "Login with Google",
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
                        Text("Don't have an account? "),
                        TextbuttonLoginSignupWidget(
                          title: "Sign Up",
                          onPressed: () {
                            controller.goToSignUp();
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
