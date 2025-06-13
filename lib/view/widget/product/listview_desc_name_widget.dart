import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:flutter/material.dart';

class ListviewDescNameWidget extends StatelessWidget {
  final String proname;
  final String proprice;
  const ListviewDescNameWidget({
    super.key,
    required this.proname,
    required this.proprice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            proname,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          proprice,
          style: const TextStyle(
            fontSize: 30,
            fontFamily: "statu",
            fontWeight: FontWeight.bold,
            color: AppMyColor.primarycolor,
          ),
        ),
      ],
    );
  }
}
