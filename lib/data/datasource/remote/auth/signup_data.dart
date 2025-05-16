import 'package:e_commerce_application/core/class/crud.dart';
import 'package:e_commerce_application/core/constant/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username, String email, String phone, String password) async {
    var response = await crud.postData(Linkapi.signup, {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
