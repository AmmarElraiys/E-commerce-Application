import 'package:get/get_utils/src/extensions/export.dart';

class PhoneValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "51".tr;
    }

    // Sadece rakam ve minimum 10 haneli (ülkene göre değişebilir)
    if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
      return "52".tr;
    }

    return null; // geçerli
  }
}
