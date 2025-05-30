import 'package:e_commerce_application/controller/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  Future<void> _rateApp() async {
    final url =
        Platform.isAndroid
            ? 'https://play.google.com/store/apps/details?id=com.example.yourapp'
            : 'https://apps.apple.com/app/id000000000'; // App Store linki
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Get.snackbar('Error', 'Could not open store page');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                leading: const Icon(Icons.language, color: Colors.blueAccent),
                title: Text('Language'.tr, style: theme.textTheme.titleMedium),
                trailing: DropdownButton<String>(
                  value: Get.locale?.languageCode,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(value: 'en', child: Text('English')),
                    DropdownMenuItem(value: 'ar', child: Text('العربية')),
                  ],
                  onChanged: (langCode) {
                    if (langCode == "en") {
                      controller.changeLang("en");
                    } else {
                      controller.changeLang("ar");
                    }
                  },
                ),
              ),
              const Divider(indent: 16, endIndent: 16),

              ListTile(
                leading: const Icon(Icons.lock, color: Colors.deepOrange),
                title: Text(
                  'Change Password',
                  style: theme.textTheme.titleMedium,
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Get.toNamed('/change-password');
                },
              ),
              const Divider(indent: 16, endIndent: 16),

              ListTile(
                leading: const Icon(Icons.star_rate, color: Colors.amber),
                title: Text('Rate App', style: theme.textTheme.titleMedium),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: _rateApp,
              ),
              const Divider(indent: 16, endIndent: 16),

              ListTile(
                leading: const Icon(Icons.exit_to_app, color: Colors.redAccent),
                title: Text('Exit App', style: theme.textTheme.titleMedium),
                onTap: () => exit(0),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
