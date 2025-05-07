import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    title: "55".tr,
    middleText: "56".tr,
    actions: [
      ElevatedButton(
        onPressed: () {
          Get.back(); // Dismiss dialog
        },
        child: Text("57".tr),
      ),
      ElevatedButton(
        onPressed: () {
          exit(0); // You can also use exit(0) or SystemNavigator.pop()
        },
        child: Text("58".tr),
      ),
    ],
  );
  return Future.value(true);
}
