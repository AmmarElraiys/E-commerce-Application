import 'package:e_commerce_application/core/class/crud.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.postData(Linkapi.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
