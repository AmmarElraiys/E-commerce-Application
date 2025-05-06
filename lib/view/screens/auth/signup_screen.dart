import 'package:e_commerce_application/core/utils/auth/email_validator.dart';
import 'package:e_commerce_application/core/utils/auth/password_validator.dart';
import 'package:e_commerce_application/view/widget/auth/button_login_signup_widget.dart';
import 'package:e_commerce_application/view/widget/auth/logo_image.dart';
import 'package:e_commerce_application/view/widget/auth/textbutton_login_signup_widget.dart';
import 'package:e_commerce_application/view/widget/auth/textformfield_widget.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Form(
                key: formKey,
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    SizedBox(height: 50),
                    LogoImage(image: "assets/images/shopping.png"),
                    SizedBox(height: 60),
                    Text(
                      'welecome back',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    // Email & Password Fields
                    TextFormFieldWidget(
                      label: "Email",
                      icon: Icons.email,
                      controller: controllerEmail,
                      iconColor: Colors.blue[200],
                      validator: EmailValidator.validate,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormFieldWidget(
                      label: "Password",
                      icon: Icons.lock,
                      controller: controllerPassword,
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
                        "assets/images/search.png",
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
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
    );
  }
}
