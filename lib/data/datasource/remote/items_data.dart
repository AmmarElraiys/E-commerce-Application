import 'package:e_commerce_application/core/class/crud.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id) async {
    var response = await crud.postData(Linkapi.itemspage, {
      "id": id.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
