import 'package:get/get_utils/src/extensions/export.dart';

class EmailValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "53".tr;
    }

    // Basit bir e-posta doğrulama regex'i
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegex.hasMatch(value)) {
      return "54".tr;
    }

    return null; // geçerli
  }
}
