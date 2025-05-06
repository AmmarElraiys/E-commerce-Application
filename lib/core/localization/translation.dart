import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en": {"1": "Choose Language", "2": "Arabic", "3": "English"},
    "ar": {"1": "اختر اللغة", "2": "عربي", "3": "إنجليزي"},
  };
}
