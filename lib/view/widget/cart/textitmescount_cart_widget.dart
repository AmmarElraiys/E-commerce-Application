import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:flutter/material.dart';

class TextitmescountCartWidget extends StatefulWidget {
  final String title;
  const TextitmescountCartWidget({super.key, required this.title});

  @override
  State<TextitmescountCartWidget> createState() =>
      _TextitmescountCartWidgetState();
}

class _TextitmescountCartWidgetState extends State<TextitmescountCartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animasyon controller'ı tanımla
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true); // Gidip gelme animasyonu

    // -5 ve +5 piksel arası yatay hareket
    _animation = Tween<double>(
      begin: -5.0,
      end: 5.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose(); // Bellek sızıntısını önle
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppMyColor.primarycolor,
        boxShadow: [
          BoxShadow(
            color: AppMyColor.primarycolor.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ANİMASYONLU İKON
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(_animation.value, 0), // sola-sağa hareket
                child: child,
              );
            },
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
