import 'package:e_commerce_application/controller/cart/cart_controller.dart';
import 'package:e_commerce_application/core/class/handlingdataview.dart';
import 'package:e_commerce_application/core/constant/imageassets.dart';
import 'package:e_commerce_application/core/functions/tarnslate_database.dart';
import 'package:e_commerce_application/view/widget/cart/appbar_cart_widget.dart';
import 'package:e_commerce_application/view/widget/cart/buildcartItem_cart_widget.dart';
import 'package:e_commerce_application/view/widget/cart/buildtotalsection_cart_widget.dart';
import 'package:e_commerce_application/view/widget/cart/button_cart_widget.dart';
import 'package:e_commerce_application/view/widget/cart/textitmescount_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartcontroller = Get.put(CartController());
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        cartcontroller.resetvarCart(); // geri basınca data clear
        return true; // true => geri gitmeye izin ver
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F6FA),
        appBar: AppbarCartWidget(title: "My Cart"),
        body: GetBuilder<CartController>(
          builder:
              (controller) => Handlingdataview(
                statusRequist: controller.statusRequist,
                widget: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    TextitmescountCartWidget(
                      title:
                          "You have ${cartcontroller.totalcountitems} items in your list",
                    ),
                    const SizedBox(height: 10),
                    ...List.generate(
                      cartcontroller.data.length,
                      (index) => BuildcartitemCartWidget(
                        imagestitle: AppImageassets.logoImage,
                        itemstitle: translateDatabase(
                          cartcontroller.data[index].itemsNameAr!,
                          cartcontroller.data[index].itemsName!,
                        ),
                        price: "${cartcontroller.data[index].itemsPrice}",
                        title: '${cartcontroller.data[index].countitems}',
                        imagename: '${cartcontroller.data[index].itemsImage}',
                        onPressedadd: () async {
                          await cartcontroller.addCart(
                            "${cartcontroller.data[index].itemsId}",
                          );
                          cartcontroller.refreshPage();
                        },
                        onPressedremove: () async {
                          await cartcontroller.removeCart(
                            "${cartcontroller.data[index].itemsId}",
                          );
                          cartcontroller.refreshPage();
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    BuildtotalsectionCartWidget(
                      price: "${cartcontroller.priceorders}",
                    ),
                    const SizedBox(height: 24),
                    ButtonCartWidget(
                      title: "Proceed to Checkout",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
