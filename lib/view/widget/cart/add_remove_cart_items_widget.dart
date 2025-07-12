import 'package:flutter/material.dart';

class AddRemoveCartItemsWidget extends StatelessWidget {
  const AddRemoveCartItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            padding: const EdgeInsets.all(4),
            iconSize: 28,
            onPressed: () {},
            icon: const Icon(Icons.remove),
            color: Colors.deepPurple,
            splashRadius: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "1",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.deepPurple,
              ),
            ),
          ),
          IconButton(
            padding: const EdgeInsets.all(4),
            iconSize: 28,
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: Colors.deepPurple,
            splashRadius: 22,
          ),
        ],
      ),
    );
  }
}
