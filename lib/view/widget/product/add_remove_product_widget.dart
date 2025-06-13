import 'package:flutter/material.dart';

class AddRemoveProductWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
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
                onPressed: onPressedremove,
                splashRadius: 20,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "statu",
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: onPressedadd,
                splashRadius: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
