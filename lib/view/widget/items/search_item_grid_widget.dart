import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_application/controller/home/home_controller.dart';
import 'package:e_commerce_application/controller/items_controller.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';
import 'package:e_commerce_application/core/functions/tarnslate_database.dart';
import 'package:e_commerce_application/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchItemGridWidget extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  final int index;

  const SearchItemGridWidget({
    super.key,
    required this.itemsModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controllerImp = Get.put(HomeControllerImp());
    return GestureDetector(
      onTap: () {
        controllerImp.goToProductDetailsPage(itemsModel);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          // ignore: deprecated_member_use
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.12),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ürün görseli
            Hero(
              tag: 'search_item_$index',
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: CachedNetworkImage(
                  imageUrl: "${Linkapi.imagesItems}/${itemsModel.itemsImage}",
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ürün adı
                  Text(
                    translateDatabase(
                      itemsModel.itemsNameAr!,
                      itemsModel.itemsName!,
                    ),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  // Ürün açıklaması
                  Text(
                    translateDatabase(
                      itemsModel.itemsDescAr!,
                      itemsModel.itemsDesc!,
                    ),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  // Alt kısım: fiyat ve yıldız
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Fiyat
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "\$${itemsModel.itemsPrice}",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      // Yıldız ve puan
                      Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const SizedBox(width: 3),
                          Text(
                            "3.5",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
