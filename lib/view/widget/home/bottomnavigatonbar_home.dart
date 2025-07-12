import 'package:e_commerce_application/controller/home/home_screen_controller.dart';
import 'package:e_commerce_application/view/widget/home/bottomnavigationbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class BottomnavigatonbarHome extends GetView<HomeScreenControllerImp> {
  const BottomnavigatonbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 100,
      shape: CircularNotchedRectangle(),
      notchMargin: 14,
      child: Row(
        children: [
          ...List.generate(controller.listPage.length + 1, (index) {
            int i = index > 2 ? index - 1 : index;
            return index == 2
                ? const Expanded(child: SizedBox()) // fab boşluğu için
                : BottomnavigationbarWidget(
                  onPressed: () {
                    controller.changePage(i);
                  },
                  title: controller.titlelistPage[i],
                  icon: controller.iconListPage[i],
                  active: controller.currentPage == i,
                );
          }),
        ],
      ),
    );
  }
}
