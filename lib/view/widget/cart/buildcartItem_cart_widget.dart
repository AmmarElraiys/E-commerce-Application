import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';
import 'package:e_commerce_application/view/widget/product/add_remove_product_widget.dart';
import 'package:flutter/material.dart';

class BuildcartitemCartWidget extends StatelessWidget {
  final String imagestitle;
  final String itemstitle;
  final String price;
  final String title;
  final String imagename;
  final void Function()? onPressedadd;
  final void Function()? onPressedremove;
  const BuildcartitemCartWidget({
    super.key,
    required this.imagestitle,
    required this.itemstitle,
    required this.price,
    required this.title,
    required this.imagename,
    required this.onPressedadd,
    required this.onPressedremove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Card(
        color: AppMyColor.grey50,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadowColor: AppMyColor.black12,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: '${Linkapi.imagesItems}/$imagename',
                  height: 90,
                  width: 90,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      itemstitle,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppMyColor.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "\$ $price",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "statu",
                        fontWeight: FontWeight.w600,
                        color: AppMyColor.blue,
                      ),
                    ),
                  ],
                ),
              ),
              AddRemoveProductWidget(
                onPressedadd: onPressedadd,
                onPressedremove: onPressedremove,
                title: title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
