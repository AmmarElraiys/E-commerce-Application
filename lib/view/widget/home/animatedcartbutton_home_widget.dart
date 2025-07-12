import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:flutter/material.dart';

class AnimatedCartButton extends StatefulWidget {
  final VoidCallback onPressed;
  final int cartCount;

  const AnimatedCartButton({
    super.key,
    required this.onPressed,
    this.cartCount = 0,
  });

  @override
  State<AnimatedCartButton> createState() => _AnimatedCartButtonState();
}

class _AnimatedCartButtonState extends State<AnimatedCartButton>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _tapController;

  late Animation<double> _pulseScale;
  late Animation<double> _tapScale;
  late Animation<double> _tapRotation;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _pulseScale = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _tapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _tapScale = Tween<double>(
      begin: 1.0,
      end: 1.15,
    ).animate(CurvedAnimation(parent: _tapController, curve: Curves.easeOut));

    _tapRotation = Tween<double>(
      begin: 0.0,
      end: 0.05,
    ).animate(CurvedAnimation(parent: _tapController, curve: Curves.easeInOut));
  }

  Future<void> _onTap() async {
    await _tapController.forward();
    await _tapController.reverse();
    widget.onPressed();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _tapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_pulseController, _tapController]),
      builder: (context, child) {
        final totalScale = _pulseScale.value * _tapScale.value;
        return Transform.scale(
          scale: totalScale,
          child: Transform.rotate(
            angle: _tapRotation.value,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppMyColor.primarycolor.withOpacity(0.5),
                        blurRadius: 15,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                      BoxShadow(
                        color: AppMyColor.primarycolor.withOpacity(0.2),
                        blurRadius: 25,
                        spreadRadius: 5,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: FloatingActionButton(
                    backgroundColor: AppMyColor.primarycolor,
                    elevation: 6,
                    onPressed: _onTap,
                    child: const Icon(Icons.shopping_bag_outlined),
                  ),
                ),

                // 🔴 Badge
                if (widget.cartCount > 0)
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 22,
                        minHeight: 22,
                      ),
                      child: Center(
                        child: Text(
                          '${widget.cartCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
