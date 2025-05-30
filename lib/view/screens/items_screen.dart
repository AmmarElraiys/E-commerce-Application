import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_application/controller/items_controller.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';
import 'package:e_commerce_application/view/widget/home/textformfield_search_widget.dart';
import 'package:e_commerce_application/view/widget/items/item_grid_widget.dart';
import 'package:e_commerce_application/view/widget/items/listcategories_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body: ListView(
        children: [
          TextformfieldSearchWidget(onTap: () {}, title: "Find Product"),
          SizedBox(height: 30),
          ListcategoriesItemsWidget(),
          // ItemGridWidget(itemsModel: null,)
        ],
      ),
    );
  }
}
