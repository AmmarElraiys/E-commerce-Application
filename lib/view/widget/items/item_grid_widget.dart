import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_application/controller/favorite_controller.dart';
import 'package:e_commerce_application/controller/items_controller.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';
import 'package:e_commerce_application/core/functions/tarnslate_database.dart';
import 'package:e_commerce_application/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemGridWidget extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  final int index;
  // final bool active;

  const ItemGridWidget({
    super.key,
    required this.itemsModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToProductDetailsPage(itemsModel);
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
                    imageUrl: "${Linkapi.imagesItems}/${itemsModel.itemsImage}",
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
                  itemsModel.itemsNameAr!,
                  itemsModel.itemsName!,
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
                  itemsModel.itemsDescAr!,
                  itemsModel.itemsDesc!,
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
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text("3.5", style: Theme.of(context).textTheme.bodySmall),
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
                    "\$${itemsModel.itemsPrice}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "stau",
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  GetBuilder<FavoriteController>(
                    builder:
                        (controller) => Container(
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemsId] ==
                                  "1") {
                                controller.setFavorite(itemsModel.itemsId, "0");
                              } else {
                                controller.setFavorite(itemsModel.itemsId, "1");
                              }
                            },
                            icon: Icon(
                              controller.isFavorite[itemsModel.itemsId] == "1"
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
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
