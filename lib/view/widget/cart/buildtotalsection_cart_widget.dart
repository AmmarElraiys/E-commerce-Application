import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:flutter/material.dart';

class BuildtotalsectionCartWidget extends StatelessWidget {
  final String price;
  const BuildtotalsectionCartWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          Text(
            "\$ $price",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppMyColor.primarycolor,
              fontFamily: 'statu',
            ),
          ),
        ],
      ),
    );
  }
}
