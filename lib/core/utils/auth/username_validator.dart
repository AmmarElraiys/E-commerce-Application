import 'package:get/get_utils/src/extensions/export.dart';

class UsernameValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "43".tr;
    }
    return null; // geçerli
  }
}
