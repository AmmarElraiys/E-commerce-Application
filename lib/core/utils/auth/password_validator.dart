import 'package:get/get_utils/src/extensions/export.dart';

class PasswordValidator {
  static String? validate(String? value, [String? originalPassword]) {
    if (value == null || value.isEmpty) {
      return '44'.tr;
    }

    if (value.length < 8) {
      return '45'.tr;
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return '46'.tr;
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return '47'.tr;
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return '48'.tr;
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return '49'.tr;
    }

    // Eğer originalPassword verildiyse, şifreleri karşılaştır (confirm password için)
    if (originalPassword != null && value != originalPassword) {
      return '50'.tr;
    }

    return null;
  }
}
