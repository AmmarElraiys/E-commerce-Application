import 'package:e_commerce_application/core/constant/linkapi.dart';
import 'package:e_commerce_application/core/functions/tarnslate_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce_application/controller/home/home_controller.dart';
import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/data/model/categoies_model.dart';

class CategoriesWidget extends GetView<HomeControllerImp> {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 70,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoiesModel: CategoiesModel.fromJson(
              controller.categories[index],
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class Categories extends GetView<HomeControllerImp> {
  CategoiesModel categoiesModel;
  final int? i;
  Categories({super.key, required this.categoiesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  // ignore: deprecated_member_use
                  AppMyColor.primarycolor.withOpacity(0.15),
                  Colors.white,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
              border: Border.all(
                // ignore: deprecated_member_use
                color: AppMyColor.primarycolor.withOpacity(0.3),
              ),
            ),
            child: InkWell(
              onTap: () {
                controller.goToItems(
                  controller.categories,
                  i!,
                  categoiesModel.categoriesId!,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.network(
                  "${Linkapi.imagesCategories}/${categoiesModel.categoriesImage}",
                  fit: BoxFit.contain,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          Icon(Icons.broken_image, color: AppMyColor.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            " ${translateDatabase(categoiesModel.categoriesNameAr, categoiesModel.categoriesName)}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
