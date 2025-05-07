import 'package:flutter/material.dart';

class LogoImage extends StatefulWidget {
  final String image; // late değil, doğrudan final olarak al

  const LogoImage({
    super.key,
    required this.image,
  }); // required olarak constructor'da al

  @override
  State<LogoImage> createState() => _LogoImageState();
}

class _LogoImageState extends State<LogoImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Container(
          alignment: Alignment.center,
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            widget.image, // burası widget.image olmalı
            height: 100,
          ),
        ),
      ],
    );
  }
}
