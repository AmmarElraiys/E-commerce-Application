import 'package:e_commerce_application/controller/myfavorite_controller.dart';
import 'package:e_commerce_application/core/class/handlingdataview.dart';
import 'package:e_commerce_application/data/model/myfavorite_model.dart';
import 'package:e_commerce_application/view/widget/home/textformfield_search_widget.dart';
import 'package:e_commerce_application/view/widget/myfavorite/myfavorite_item_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyfavoriteScreen extends StatelessWidget {
  const MyfavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyfavoriteControllerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyfavoriteControllerImp>(
          builder:
              (controller) => ListView(
                children: [
                  // TextformfieldSearchWidget(
                  //   onTap: () {},
                  //   title: "59".tr,
                  //   onTapfav: () {},
                  // ),
                  SizedBox(height: 10),
                  Handlingdataview(
                    statusRequist: controller.statusRequist,
                    widget: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        return MyFavoriteItemGridWidget(
                          myFavoriteModel: MyFavoriteModel.fromJson(
                            controller.data[index],
                          ),
                          index: index,
                        );
                      },
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
