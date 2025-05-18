import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final String imageUrl;
  final String proname;
  final void Function()? onTap;

  const CategoriesWidget({
    super.key,
    required this.imageUrl,
    required this.onTap,
    required this.proname,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  // ignore: deprecated_member_use
                  AppMyColor.primarycolor.withOpacity(0.15),
                  Colors.white,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
              border: Border.all(
                // ignore: deprecated_member_use
                color: AppMyColor.primarycolor.withOpacity(0.3),
              ),
            ),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          Icon(Icons.broken_image, color: AppMyColor.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            proname,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
