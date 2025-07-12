import 'package:e_commerce_application/core/class/statusrequist.dart';
import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/core/functions/handlingdata.dart';
import 'package:e_commerce_application/core/services/services.dart';
import 'package:e_commerce_application/data/datasource/remote/cart_dart.dart';
import 'package:e_commerce_application/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartData cartData = CartData(Get.find());
  final MyServices myServices = Get.find();

  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalcountitems = 0;

  StatusRequist statusRequist = StatusRequist.none;

  /// Sepete ürün ekleme
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
        refreshPage();
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
        refreshPage();
      } else {
        statusRequist = StatusRequist.failure;
      }
    }
    update();
  }

  /// Belirli ürünün sepet içindeki adedini getirir
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

  /// Sepeti görüntüle ve güncelle
  Future<void> viewCart() async {
    statusRequist = StatusRequist.loading;
    update();

    final response = await cartData.viewCart(
      myServices.sharedPreferences.getString("id")!,
    );
    print("viewCart response: $response");

    statusRequist = handlingData(response);
    if (statusRequist == StatusRequist.success &&
        response['status'] == "success") {
      // ✅ type check
      if (response['datacart'] is List && response['datacountprice'] is Map) {
        List responsedata = response['datacart'];
        Map responsedatacountprice = response['datacountprice'];

        data = responsedata.map((e) => CartModel.fromJson(e)).toList();
        priceorders =
            double.tryParse(responsedatacountprice['totalprice'].toString()) ??
            0.0;
        totalcountitems =
            int.tryParse(responsedatacountprice['totalcount'].toString()) ?? 0;
      }
    } else {
      statusRequist = StatusRequist.failure;
    }
    update();
  }

  /// Sepeti ve sayacı sıfırla
  void resetvarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  /// Yenile
  void refreshPage() {
    resetvarCart();
    viewCart();
  }

  @override
  void onInit() {
    viewCart();
    super.onInit();
  }
}
