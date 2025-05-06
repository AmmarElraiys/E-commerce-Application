import 'package:flutter/material.dart';

class ButtonLoginSignupWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Widget? icon;

  const ButtonLoginSignupWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon, // Eğer ikon null ise boş widget koy
      label: Text(text),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
