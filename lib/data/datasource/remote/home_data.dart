import 'package:e_commerce_application/core/class/crud.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  postData() async {
    var response = await crud.postData(Linkapi.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}
