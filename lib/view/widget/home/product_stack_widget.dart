import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:flutter/material.dart';

class ProductStackWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const ProductStackWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 370,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Ana kart
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 150,
            decoration: BoxDecoration(
              color: AppMyColor.primarycolor,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // Dekoratif yuvarlaklar
          Positioned(
            top: -20,
            right: -30,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: -60,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
