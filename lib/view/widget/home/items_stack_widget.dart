import 'package:flutter/material.dart';

class ItemsStackWidget extends StatelessWidget {
  final String imagename;
  final String title; // opsiyonel başlık

  const ItemsStackWidget({
    super.key,
    required this.imagename,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),

      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            child: Image.network(
              imagename,
              fit: BoxFit.contain,
              height: 200,
              width: 200,
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // ignore: deprecated_member_use
                  Colors.black.withOpacity(0.8),
                  // ignore: deprecated_member_use
                  Colors.black.withOpacity(0.3),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          Positioned(
            left: 16,
            bottom: 16,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.black45,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
