import 'package:e_commerce_application/core/class/statusrequist.dart';
import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/core/functions/handlingdata.dart';
import 'package:e_commerce_application/core/services/services.dart';
import 'package:e_commerce_application/data/datasource/remote/home_data.dart';
import 'package:e_commerce_application/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  intialData();
  getData();
  goToItems(List categories, int selectedCat, String catogryid);
  goToMyFavorite();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  late StatusRequist statusRequist;
  HomeData homeData = HomeData(Get.find());
  List data = [];
  List categories = [];
  List items = [];
  ItemsModel? itemsModel;
  String? username;
  String? id;
  String? email;
  String? phone;
  intialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    email = myServices.sharedPreferences.getString("email");
    phone = myServices.sharedPreferences.getString("phone");
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
  void onInit() {
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
  goToMyFavorite() {
    Get.toNamed(AppRoutes.myfavorite);
  }
}
