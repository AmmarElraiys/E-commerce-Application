import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:flutter/material.dart';

class AppbarCartWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const AppbarCartWidget({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AppbarCartWidget> createState() => _AppbarCartWidgetState();
}

class _AppbarCartWidgetState extends State<AppbarCartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppMyColor.white,
      elevation: 1,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min, // important for centering
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 6.3,
                child: Icon(
                  Icons.shopping_cart,
                  color: AppMyColor.primarycolor,
                  size: 24,
                ),
              );
            },
          ),
          const SizedBox(width: 8),
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
