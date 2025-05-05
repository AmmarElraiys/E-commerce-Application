import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:flutter/material.dart';

class ButtoncostumOnboarding extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const ButtoncostumOnboarding({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      color: AppMyColor.primarycolor,
      child: Text(title),
    );
  }
}
