import 'package:e_commerce_application/controller/favorite_controller.dart';
import 'package:e_commerce_application/controller/product_details_controller.dart';
import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';
import 'package:e_commerce_application/core/functions/tarnslate_database.dart';
import 'package:e_commerce_application/view/widget/product/Image_section_stack_widget.dart';
import 'package:e_commerce_application/view/widget/product/add_remove_product_widget.dart';
import 'package:e_commerce_application/view/widget/product/listview_desc_name_widget.dart';
import 'package:e_commerce_application/view/widget/product/product_details_color_widget.dart';
import 'package:e_commerce_application/view/widget/product/text_widget.dart';
import 'package:e_commerce_application/view/widget/tocart_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsControllerImp());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Üst görsel ve geri tuşu
            GetBuilder<FavoriteController>(
              builder:
                  (controllerfav) => ImageSectionStackWidget(
                    tag: controller.itemsModel.itemsId.toString(),
                    imageUrl:
                        "${Linkapi.imagesItems}/${controller.itemsModel.itemsImage}",
                    onPressedback: () => Get.back(),
                    onPressedfavorite: () {
                      if (controllerfav.isFavorite[controller
                              .itemsModel
                              .itemsId] ==
                          "1") {
                        controllerfav.setFavorite(
                          controller.itemsModel.itemsId,
                          "0",
                        );
                        controllerfav.removeFavorite(
                          controller.itemsModel.itemsId!,
                        );
                      } else {
                        controllerfav.setFavorite(
                          controller.itemsModel.itemsId,
                          "1",
                        );
                        controllerfav.addFavorite(
                          controller.itemsModel.itemsId!,
                        );
                      }
                    },
                    iconfav:
                        controllerfav.isFavorite[controller
                                    .itemsModel
                                    .itemsId] ==
                                "1"
                            ? Icons.favorite
                            : Icons.favorite_border,
                    colorfav: Colors.red,
                  ),
            ),

            // Ürün detayları
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 25,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, -6),
                    ),
                  ],
                ),
                child: ListView(
                  children: [
                    // Başlık ve fiyat
                    ListviewDescNameWidget(
                      proname: translateDatabase(
                        controller.itemsModel.itemsNameAr!,
                        controller.itemsModel.itemsName!,
                      ),
                      proprice: "\$${controller.itemsModel.itemsPrice}",
                    ),

                    const SizedBox(height: 12),

                    // Değerlendirme yıldızları
                    Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                          size: 22,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Adet arttır / azalt
                    Center(
                      child: AddRemoveProductWidget(
                        onPressedadd: () {},
                        onPressedremove: () {},
                        title: '2',
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Açıklama
                    TextWidget(titel: "76".tr),
                    const SizedBox(height: 8),
                    TextWidget(
                      titel: translateDatabase(
                        controller.itemsModel.itemsDescAr!,
                        controller.itemsModel.itemsDesc!,
                      ),
                    ),

                    const SizedBox(height: 30),
                    TextWidget(titel: "77".tr),

                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        ProductDetailsColorWidget(color: AppMyColor.red),
                        SizedBox(width: 12),
                        ProductDetailsColorWidget(color: AppMyColor.green),
                        SizedBox(width: 12),
                        ProductDetailsColorWidget(color: AppMyColor.blue),
                        SizedBox(width: 12),
                        ProductDetailsColorWidget(color: Colors.orange),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Sepete Ekle Butonu
      bottomNavigationBar: TocartButtonWidget(
        title: '78'.tr,
        onPressed: () {
          Get.snackbar(
            "79".tr,
            "80".tr,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppMyColor.primarycolor,
            colorText: Colors.white,
            duration: const Duration(seconds: 2),
            margin: const EdgeInsets.all(12),
            borderRadius: 12,
          );
        },
      ),
    );
  }
}
