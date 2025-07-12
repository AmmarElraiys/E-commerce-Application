// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:flutter/material.dart';

class TextformfieldSearchWidget extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onTapfav;
  final void Function()? onTapSearch;
  final void Function(String)? onchange;
  final TextEditingController myController;
  final String title;
  const TextformfieldSearchWidget({
    super.key,
    required this.onTap,
    required this.onTapfav,
    required this.title,
    this.onTapSearch,
    this.onchange,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 16),
      child: Row(
        children: [
          Expanded(
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(12),
              child: TextFormField(
                controller: myController,
                onChanged: onchange,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: onTapSearch,
                    icon: Icon(Icons.search),
                  ),
                  hintText: title,
                  filled: true,
                  fillColor: AppMyColor.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(12),
            color: AppMyColor.white,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onTapfav,
              child: Container(
                width: 55,
                height: 55,
                alignment: Alignment.center,
                child: Icon(
                  Icons.favorite_border,
                  size: 28,
                  color: AppMyColor.grey_700,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(12),
            color: AppMyColor.white,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onTap,
              child: Container(
                width: 55,
                height: 55,
                alignment: Alignment.center,
                child: Icon(
                  Icons.notifications_active_outlined,
                  size: 28,
                  color: AppMyColor.grey_700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
