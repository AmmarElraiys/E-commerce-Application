import 'package:e_commerce_application/core/class/crud.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);
  searchDataget(String search) async {
    var response = await crud.postData(Linkapi.itemsSearchPage, {
      "search": search,
    });
    return response.fold((l) => l, (r) => r);
  }
}
