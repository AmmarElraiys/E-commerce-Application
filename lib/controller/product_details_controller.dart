import 'package:e_commerce_application/core/class/statusrequist.dart';
import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/core/functions/handlingdata.dart';
import 'package:e_commerce_application/core/services/services.dart';
import 'package:e_commerce_application/data/datasource/remote/cart_dart.dart';
import 'package:e_commerce_application/data/model/cart_model.dart';
import 'package:e_commerce_application/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  // CartController cartController = Get.put(CartController());
  StatusRequist statusRequist = StatusRequist.none;
  late ItemsModel itemsModel;
  int countitems = 0;
  final CartData cartData = CartData(Get.find());
  final MyServices myServices = Get.find();

  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalcountitems = 0;
  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  Future<void> addCart(String itemsid) async {
    statusRequist = StatusRequist.loading;
    update();

    final response = await cartData.addCart(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    print("addCart response: $response");

    statusRequist = handlingData(response);
    if (statusRequist == StatusRequist.success) {
      if (response['status'] == "success") {
        Get.snackbar(
          "28".tr,
          "81".tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppMyColor.primarycolor,
          colorText: AppMyColor.white,
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: AppMyColor.white,
          ),
          borderRadius: 10,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2),
        );
      } else {
        statusRequist = StatusRequist.failure;
      }
    }
    update();
  }

  /// Sepetten ürün çıkarma
  Future<void> removeCart(String itemsid) async {
    statusRequist = StatusRequist.loading;
    update();

    final response = await cartData.removeCart(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    print("removeCart response: $response");

    statusRequist = handlingData(response);
    if (statusRequist == StatusRequist.success) {
      if (response['status'] == "success") {
        Get.snackbar(
          "28".tr,
          "82".tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppMyColor.red,
          colorText: AppMyColor.white,
          icon: const Icon(
            Icons.remove_shopping_cart_rounded,
            color: AppMyColor.white,
          ),
          borderRadius: 10,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2),
        );
      } else {
        statusRequist = StatusRequist.failure;
      }
    }
    update();
  }

  Future<int?> countItemsInCart(String itemsid) async {
    statusRequist = StatusRequist.loading;

    final response = await cartData.getCountItemsCart(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    print("countItemsInCart response: $response");

    statusRequist = handlingData(response);
    if (statusRequist == StatusRequist.success &&
        response['status'] == "success") {
      return int.tryParse(response['data'].toString());
    } else {
      statusRequist = StatusRequist.failure;
      return null;
    }
  }

  initalData() async {
    statusRequist = StatusRequist.loading;
    if (Get.arguments != null && Get.arguments['itemsmodel'] != null) {
      itemsModel = Get.arguments['itemsmodel'];
    }
    countitems = (await countItemsInCart(itemsModel.itemsId!))!;
    statusRequist = StatusRequist.success;
    update();
  }

  add() {
    addCart(itemsModel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      removeCart(itemsModel.itemsId!);
      countitems--;
    }
    update();
  }

  goToCart() {
    Get.toNamed(AppRoutes.myCart);
  }
}
