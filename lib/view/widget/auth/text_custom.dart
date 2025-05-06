// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String title;
  const TextCustom({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 30),
      child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
