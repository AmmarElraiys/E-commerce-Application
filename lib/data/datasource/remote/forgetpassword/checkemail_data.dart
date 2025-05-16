import 'package:e_commerce_application/core/class/crud.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';

class ChecEmailkData {
  Crud crud;
  ChecEmailkData(this.crud);
  postData(email) async {
    var response = await crud.postData(Linkapi.checkEmail, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
