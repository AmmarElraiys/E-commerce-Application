import 'package:e_commerce_application/controller/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/data/model/categoies_model.dart';

class ListcategoriesItemsWidget extends GetView<ItemsControllerImp> {
  const ListcategoriesItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 70,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 15),
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
class Categories extends GetView<ItemsControllerImp> {
  CategoiesModel categoiesModel;
  final int? i;
  Categories({super.key, required this.categoiesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder:
                (controller) => Container(
                  decoration:
                      controller.selectedCat == i
                          ? BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 3,
                                color: AppMyColor.primarycolor,
                              ),
                            ),
                          )
                          : null,
                  child: InkWell(
                    onTap: () {
                      // controller.goToItems(controller.categories, i!);
                      controller.changecat(i!);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        " ${categoiesModel.categoriesName}",
                        style: TextStyle(
                          fontWeight:
                              controller.selectedCat == i
                                  ? FontWeight.bold
                                  : FontWeight.w600,
                          fontSize: controller.selectedCat == i ? 18 : 14,
                          color:
                              controller.selectedCat == i
                                  ? AppMyColor.black
                                  : Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
