import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:flutter/material.dart';

class BottomnavigationbarWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final IconData? icon;
  final bool active;

  const BottomnavigationbarWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.icon,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color:
              active
                  // ignore: deprecated_member_use
                  ? AppMyColor.primarycolor.withOpacity(0.1)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          boxShadow:
              active
                  ? [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: AppMyColor.primarycolor.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ]
                  : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: active ? 35 : 25,
              color: active ? AppMyColor.primarycolor : AppMyColor.grey1,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
                color: active ? AppMyColor.primarycolor : AppMyColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
