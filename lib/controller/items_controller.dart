import 'package:e_commerce_application/core/class/statusrequist.dart';
import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/core/functions/handlingdata.dart';
import 'package:e_commerce_application/core/services/services.dart';
import 'package:e_commerce_application/data/datasource/remote/items_data.dart';
import 'package:e_commerce_application/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changecat(int val, String catval);
  getItems(String catogryid);
  goToProductDetailsPage(ItemsModel itemsModel);
  goToMyFavorite();
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  String? catid;
  StatusRequist statusRequist = StatusRequist.none;
  int? selectedCat;
  MyServices myServices = Get.find();

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catogryid'];
    getItems(catid!);
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  changecat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  @override
  getItems(catogryid) async {
    data.clear();
    statusRequist = StatusRequist.loading;
    var response = await itemsData.getData(
      catogryid,
      myServices.sharedPreferences.getString("id")!,
    );
    print("=============================== $response");
    statusRequist = handlingData(response);
    if (StatusRequist.success == statusRequist) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequist = StatusRequist.failure;
      }
    }
    update();
  }

  @override
  goToProductDetailsPage(itemsModel) {
    Get.toNamed('productdetails', arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToMyFavorite() {
    Get.toNamed(AppRoutes.myfavorite);
  }
}
