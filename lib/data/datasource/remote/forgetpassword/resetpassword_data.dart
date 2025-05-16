import 'package:e_commerce_application/core/class/crud.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';

class ResetpasswordData {
  Crud crud;
  ResetpasswordData(this.crud);
  postData(email, password) async {
    var response = await crud.postData(Linkapi.resetPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
