import 'package:e_commerce_application/controller/password/verifiy_code_controller.dart';
import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/core/constant/imageassets.dart';
import 'package:e_commerce_application/view/widget/auth/logo_image.dart';
import 'package:e_commerce_application/view/widget/auth/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class VerifiycodeScreen extends StatelessWidget {
  const VerifiycodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VerifiyCodeControllerImp controller = VerifiyCodeControllerImp();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
        child: ListView(
          children: [
            TextCustom(
              title: "34".tr,
              style: Theme.of(context).textTheme.headlineSmall!,
            ),
            LogoImage(image: AppImageassets.logoImage),
            TextCustom(
              title: "35".tr,
              style: Theme.of(context).textTheme.headlineSmall!,
            ),
            TextCustom(
              title: "36".tr,
              style: Theme.of(context).textTheme.bodySmall!,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            OtpTextField(
              numberOfFields: 5,
              fieldWidth: 50,
              borderRadius: BorderRadius.circular(20),
              borderColor: AppMyColor.primarycolor,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                controller.goToResetPassword();
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
