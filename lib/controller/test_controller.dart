import 'package:e_commerce_application/core/class/statusrequist.dart';
import 'package:e_commerce_application/core/functions/handlingdata.dart';
import 'package:e_commerce_application/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequist statusRequist;

  getData() async {
    statusRequist = StatusRequist.loading;
    var response = await testData.getData();
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
  void onInit() {
    getData();
    super.onInit();
  }
}
