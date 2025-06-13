import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_application/controller/myfavorite_controller.dart';
import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';
import 'package:e_commerce_application/core/functions/tarnslate_database.dart';

import 'package:e_commerce_application/data/model/myfavorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteItemGridWidget extends GetView<MyfavoriteControllerImp> {
  final MyFavoriteModel myFavoriteModel;
  final int index;
  // final bool active;

  const MyFavoriteItemGridWidget({
    super.key,
    required this.myFavoriteModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // controllerItemsControllerImp.goToProductDetailsPage(itemsModel!);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'item_$index',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl:
                        "${Linkapi.imagesItems}/${myFavoriteModel.itemsImage}",
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    placeholder:
                        (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                translateDatabase(
                  myFavoriteModel.itemsNameAr!,
                  myFavoriteModel.itemsName!,
                ),
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                translateDatabase(
                  myFavoriteModel.itemsDescAr!,
                  myFavoriteModel.itemsDesc!,
                ),
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppMyColor.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "3.5",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "stau",
                          fontWeight: FontWeight.bold,
                          color: AppMyColor.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: List.generate(
                      4,
                      (index) =>
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${myFavoriteModel.itemsPrice}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "stau",
                      fontWeight: FontWeight.bold,
                      color: AppMyColor.green,
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        controller.deleteFromFavorite(
                          myFavoriteModel.favoriteId!,
                        );
                      },
                      icon: Icon(Icons.delete_outline, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
