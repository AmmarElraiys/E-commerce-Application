import 'package:e_commerce_application/core/class/statusrequist.dart';
import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/core/functions/handlingdata.dart';
import 'package:e_commerce_application/core/services/services.dart';
import 'package:e_commerce_application/data/datasource/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  List data = [];
  String? catid;
  StatusRequist statusRequist = StatusRequist.none;
  int? selectedCat;
  MyServices myServices = Get.find();

  Map isFavorite = {};
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    data.clear();
    statusRequist = StatusRequist.loading;
    var response = await favoriteData.addFavorite(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    print("=============================== $response");
    statusRequist = handlingData(response);
    if (StatusRequist.success == statusRequist) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.snackbar(
          "Success",
          "Item added to favorites",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppMyColor.green, // yeşil
          colorText: AppMyColor.white,
          icon: const Icon(Icons.favorite, color: AppMyColor.white),
          borderRadius: 10,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2),
        );
      } else {
        statusRequist = StatusRequist.failure;
      }
    }
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusRequist = StatusRequist.loading;
    var response = await favoriteData.removeFavorite(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    print("=============================== $response");
    statusRequist = handlingData(response);
    if (StatusRequist.success == statusRequist) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);.
        Get.snackbar(
          "Success",
          "Item removed from favorites",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppMyColor.red, // yeşil
          colorText: AppMyColor.white,
          icon: const Icon(Icons.favorite, color: AppMyColor.white),
          borderRadius: 10,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2),
        );
      } else {
        statusRequist = StatusRequist.failure;
      }
    }
  }
}
