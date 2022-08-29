import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bottom_controller.dart';

class BottomView extends GetView<BottomController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          children: [
            Container(
              child: Center(
                  child: Text(
                "Home",
              )),
            ),
            Container(
              child: Center(
                  child: Text(
                "Profile",
              )),
            ),
            Container(
              child: Center(
                  child: Text(
                "Settings",
              )),
            ),
            Container(
              child: Center(
                  child: Text(
                "update",
              )),
            ),
          ],
          controller: controller.pageController,
        ),
      ),
      bottomNavigationBar: Obx(
        () => FancyBottomNavigation(
            tabs: [
              TabData(iconData: Icons.home, title: 'Home'),
              TabData(iconData: Icons.person_outline, title: 'Profile'),
              TabData(iconData: Icons.settings_outlined, title: 'Settings'),
              TabData(iconData: Icons.update, title: 'Update'),
            ],
            onTabChangedListener: (position) {
              controller.currentIndex.value = position;
            },
        initialSelection: controller.currentIndex.value,
          key: controller.bottomNavigationKey,
        ),
      ),
    );
  }
}
