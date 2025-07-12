import 'package:e_commerce_application/core/class/statusrequist.dart';
import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/core/functions/handlingdata.dart';
import 'package:e_commerce_application/core/services/services.dart';
import 'package:e_commerce_application/data/datasource/remote/home_data.dart';
import 'package:e_commerce_application/data/datasource/remote/search_data.dart';
import 'package:e_commerce_application/data/model/items_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  intialData();
  getData();
  goToItems(List categories, int selectedCat, String catogryid);
  goToMyFavorite();
  getSearchData();
  goToProductDetailsPage(ItemsModel itemsModel);
}

class HomeControllerImp extends HomeController {
  List<ItemsModel> liestdata = [];
  MyServices myServices = Get.find();
  late StatusRequist statusRequist;
  HomeData homeData = HomeData(Get.find());
  SearchData searchData = SearchData(Get.find());
  List data = [];
  List categories = [];
  List items = [];
  ItemsModel? itemsModel;
  String? username;
  String? id;
  String? email;
  String? phone;
  TextEditingController? search;
  bool isSearch = false;

  @override
  intialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    email = myServices.sharedPreferences.getString("email");
    phone = myServices.sharedPreferences.getString("phone");
  }

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearch() {
    isSearch = true;
    getSearchData();
    update();
  }

  @override
  getData() async {
    statusRequist = StatusRequist.loading;
    update();
    var response = await homeData.postData();
    print("======================================= $response");
    statusRequist = handlingData(response);
    if (StatusRequist.success == statusRequist) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequist = StatusRequist.failure;
      }
    }
    update();
  }

  @override
  getSearchData() async {
    statusRequist = StatusRequist.loading;
    update();
    var response = await searchData.searchDataget(search!.text);
    print("======================================= $response");
    statusRequist = handlingData(response);
    if (StatusRequist.success == statusRequist) {
      if (response['status'] == "success") {
        liestdata.clear();
        List responsedata = response['data'];
        liestdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequist = StatusRequist.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    itemsModel = Get.arguments['itemsmodel'];
    intialData();
    getData();
    super.onInit();
  }

  @override
  goToItems(categories, selectedCat, catogryid) {
    Get.toNamed(
      AppRoutes.itemsscreen,
      arguments: {
        "categories": categories,
        "selectedcat": selectedCat,
        "catogryid": catogryid,
      },
    );
  }

  @override
  goToProductDetailsPage(ItemsModel itemsModel) {
    Get.toNamed(
      AppRoutes.productdetails,
      arguments: {"itemsmodel": itemsModel},
    );
  }

  @override
  goToMyFavorite() {
    Get.toNamed(AppRoutes.myfavorite);
  }
}
