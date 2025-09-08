import 'package:e_commerce_application/controller/home/home_controller.dart';
import 'package:e_commerce_application/core/class/handlingdataview.dart';
import 'package:e_commerce_application/core/functions/alertexitapp.dart';
import 'package:e_commerce_application/data/model/items_model.dart';
import 'package:e_commerce_application/view/widget/home/categories_widget.dart';
import 'package:e_commerce_application/view/widget/home/items_stack_widget.dart';
import 'package:e_commerce_application/view/widget/home/product_stack_widget.dart';
import 'package:e_commerce_application/view/widget/home/textformfield_search_widget.dart';
import 'package:e_commerce_application/view/widget/items/search_item_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder:
          // ignore: deprecated_member_use
          (controller) => WillPopScope(
            onWillPop: alertExitApp,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  TextformfieldSearchWidget(
                    onTapSearch: () {
                      controller.onSearch();
                    },
                    onTap: () {},
                    title: "59".tr,
                    onTapfav: () {
                      controller.goToMyFavorite();
                    },
                    myController: controller.search!,
                    onchange: (val) {
                      controller.checkSearch(val);
                    },
                  ),
                  HandlingdataRequest(
                    statusRequist: controller.statusRequist,
                    widget:
                        !controller.isSearch == true
                            ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                        title: "60".tr,
                                        subTitle: "61".tr,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  width: 500,
                                  child: CategoriesWidget(),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  child: Text(
                                    "62".tr,
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.headlineMedium,
                                  ),
                                ),
                                SizedBox(height: 20),
                                ItemsStackWidget(),
                              ],
                            )
                            : ListItemsSearch(
                              listmodeldata: controller.liestdata,
                            ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

class ListItemsSearch extends StatelessWidget {
  final List<ItemsModel> listmodeldata;
  const ListItemsSearch({super.key, required this.listmodeldata});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listmodeldata.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SearchItemGridWidget(
          itemsModel: listmodeldata[index],
          index: index,
        );
      },
    );
  }
}
