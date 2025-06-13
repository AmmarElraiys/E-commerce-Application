import 'package:e_commerce_application/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  initalData() {
    itemsModel = Get.arguments['itemsmodel'];
  }
}
