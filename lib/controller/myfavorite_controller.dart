import 'package:e_commerce_application/core/class/statusrequist.dart';
import 'package:e_commerce_application/core/functions/handlingdata.dart';
import 'package:e_commerce_application/core/services/services.dart';
import 'package:e_commerce_application/data/datasource/remote/myfavorite_data.dart';
// import 'package:e_commerce_application/data/model/myfavorite_model.dart';
import 'package:get/get.dart';

abstract class MyfavoriteController extends GetxController {
  getData();
  deleteFromFavorite(String favoriteid);
}

class MyfavoriteControllerImp extends MyfavoriteController {
  MyfavoriteData myfavoriteData = MyfavoriteData(Get.find());
  List data = [];
  // List<MyFavoriteModel> data = [];
  StatusRequist statusRequist = StatusRequist.none;
  int? selectedCat;
  MyServices myServices = Get.find();

  @override
  getData() async {
    data.clear();
    statusRequist = StatusRequist.loading;
    var response = await myfavoriteData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    print("=============================== $response");
    statusRequist = handlingData(response);
    if (StatusRequist.success == statusRequist) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        // List responsedata = response['data'];
        // data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("====================================== response  ==== $data");
      } else {
        statusRequist = StatusRequist.failure;
      }
    }
    update();
  }

  @override
  deleteFromFavorite(favoriteid) {
    myfavoriteData.deletedata(favoriteid);
    data.removeWhere(
      (element) => element['favorite_id'].toString() == favoriteid,
    );
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
