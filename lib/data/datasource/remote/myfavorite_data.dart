import 'package:e_commerce_application/core/class/crud.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';

class MyfavoriteData {
  Crud crud;
  MyfavoriteData(this.crud);
  getData(String usersid) async {
    var response = await crud.postData(Linkapi.viewfavorite, {"id": usersid});
    return response.fold((l) => l, (r) => r);
  }

  deletedata(String usersid) async {
    var response = await crud.postData(Linkapi.deletefavorite, {"id": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
