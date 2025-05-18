import 'package:e_commerce_application/controller/home_controller.dart';
import 'package:e_commerce_application/core/class/handlingdataview.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';
import 'package:e_commerce_application/core/functions/alertexitapp.dart';
import 'package:e_commerce_application/view/widget/home/categories_widget.dart';
import 'package:e_commerce_application/view/widget/home/items_stack_widget.dart';
import 'package:e_commerce_application/view/widget/home/product_stack_widget.dart';
import 'package:e_commerce_application/view/widget/home/textformfield_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        builder:
            (controller) => HandlingdataRequest(
              statusRequist: controller.statusRequist,
              // ignore: deprecated_member_use
              widget: WillPopScope(
                onWillPop: alertExitApp,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      TextformfieldSearchWidget(
                        onTap: () {},
                        title: "Find Product",
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 160,
                        width: 600,
                        child: ListView.separated(
                          itemCount: 2,
                          separatorBuilder:
                              (context, index) => SizedBox(width: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProductStackWidget(
                              title: "🔥 A Summer Surprise",
                              subTitle: "Cashback 20%",
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),

                      SizedBox(
                        height: 110,
                        width: 70,
                        child: ListView.separated(
                          separatorBuilder:
                              (context, index) => SizedBox(width: 10),
                          itemCount: controller.categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoriesWidget(
                              imageUrl:
                                  "${Linkapi.imagesCategories}/${controller.categories[index]['categories_image']}",
                              onTap: () {},
                              proname:
                                  '${controller.categories[index]['categories_name']}',
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        child: Text(
                          "Discounted Goods",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.items.length,
                          separatorBuilder:
                              (context, index) => const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width:
                                  370, // sabit genişlik, ekran boyutuna göre ayarlayabilirsin
                              child: ItemsStackWidget(
                                imagename:
                                    "${Linkapi.imagesItems}/${controller.items[index]['items_image']}",
                                title:
                                    '${controller.items[index]['items_desc']}: ${controller.items[index]['items_discount']} %',
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
