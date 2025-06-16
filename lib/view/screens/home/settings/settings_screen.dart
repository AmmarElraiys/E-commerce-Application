import 'package:e_commerce_application/controller/settings/settings_controller.dart';
import 'package:e_commerce_application/core/constant/color_app.dart';
import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingsController());
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Settings'.tr), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(
                  Icons.language,
                  color: AppMyColor.primarycolor,
                ),
                title: Text('68'.tr, style: theme.textTheme.titleMedium),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppMyColor.primarycolor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppMyColor.primarycolor),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: Get.locale?.languageCode,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: AppMyColor.primarycolor,
                      ),
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      style: const TextStyle(color: Colors.black),
                      items: const [
                        DropdownMenuItem(
                          value: 'en',
                          child: Row(
                            children: [
                              Text('🇺🇸 ', style: TextStyle(fontSize: 18)),
                              SizedBox(width: 8),
                              Text('English'),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'ar',
                          child: Row(
                            children: [
                              Text('🇸🇦 ', style: TextStyle(fontSize: 18)),
                              SizedBox(width: 8),
                              Text('العربية'),
                            ],
                          ),
                        ),
                      ],
                      // Seçili öğe kutusunda gösterilecek widgetlar:
                      selectedItemBuilder: (BuildContext context) {
                        return const [
                          // 'en' seçiliyse kutuda bu gösterilecek:
                          Row(
                            children: [
                              Text('🇺🇸 ', style: TextStyle(fontSize: 18)),
                              SizedBox(width: 8),
                              Text('English'),
                            ],
                          ),
                          // 'ar' seçiliyse kutuda bu gösterilecek:
                          Row(
                            children: [
                              Text('🇸🇦 ', style: TextStyle(fontSize: 18)),
                              SizedBox(width: 8),
                              Text('العربية'),
                            ],
                          ),
                        ];
                      },
                      onChanged: (langCode) {
                        controller.changeLang(langCode!);
                      },
                    ),
                  ),
                ),
              ),
              const Divider(indent: 16, endIndent: 16),

              ListTile(
                leading: const Icon(Icons.lock, color: Colors.deepOrange),
                title: Text('69'.tr, style: theme.textTheme.titleMedium),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Get.toNamed(AppRoutes.forgetpass);
                },
              ),
              const Divider(indent: 16, endIndent: 16),

              ListTile(
                leading: const Icon(Icons.star_rate, color: Colors.amber),
                title: Text('70'.tr, style: theme.textTheme.titleMedium),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
              const Divider(indent: 16, endIndent: 16),

              ListTile(
                leading: const Icon(Icons.exit_to_app, color: Colors.redAccent),
                title: Text('71'.tr, style: theme.textTheme.titleMedium),
                onTap: () {
                  Get.defaultDialog(
                    title: '73'.tr,
                    middleText: '72'.tr,
                    textConfirm: '58'.tr,
                    textCancel: '57'.tr,
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      controller.goToLogin();
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
