// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final TextStyle style;
  final String title;
  final TextAlign? textAlign;
  const TextCustom({
    super.key,
    required this.title,
    required this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 30),
      child: Text(title, style: style, textAlign: textAlign),
    );
  }
}
