import 'package:e_commerce_application/controller/items_controller.dart';
import 'package:e_commerce_application/core/class/handlingdataview.dart';
import 'package:e_commerce_application/data/model/items_model.dart';
import 'package:e_commerce_application/view/widget/home/textformfield_search_widget.dart';
import 'package:e_commerce_application/view/widget/items/item_grid_widget.dart';
import 'package:e_commerce_application/view/widget/items/listcategories_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Container(
      child: Scaffold(
        body: ListView(
          children: [
            TextformfieldSearchWidget(onTap: () {}, title: "63".tr),
            SizedBox(height: 30),
            ListcategoriesItemsWidget(),
            GetBuilder<ItemsControllerImp>(
              builder:
                  (controller) => Handlingdataview(
                    statusRequist: controller.statusRequist,
                    widget: GridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      shrinkWrap: true, // <<< Bunu ekle
                      physics: NeverScrollableScrollPhysics(), // <<< Bunu ekle
                      itemCount: controller.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemGridWidget(
                          itemsModel: ItemsModel.fromJson(
                            controller.data[index],
                          ),
                          index: index,
                        );
                      },
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
