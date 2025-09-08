import 'package:flutter/material.dart';

class AddRemoveProductWidget extends StatefulWidget {
  final void Function()? onPressedadd;
  final void Function()? onPressedremove;
  final String title;

  const AddRemoveProductWidget({
    super.key,
    required this.onPressedadd,
    required this.onPressedremove,
    required this.title,
  });

  @override
  State<AddRemoveProductWidget> createState() => _AddRemoveProductWidgetState();
}

class _AddRemoveProductWidgetState extends State<AddRemoveProductWidget> {
  double _scale = 1.0;

  void _animate() {
    setState(() => _scale = 1.15);
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() => _scale = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedScale(
          scale: _scale,
          duration: const Duration(milliseconds: 150),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    widget.onPressedremove?.call();
                    _animate();
                  },
                  splashRadius: 20,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "statu",
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    widget.onPressedadd?.call();
                    _animate();
                  },
                  splashRadius: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
