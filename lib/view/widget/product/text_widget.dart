import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String titel;
  const TextWidget({super.key, required this.titel});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        titel,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
