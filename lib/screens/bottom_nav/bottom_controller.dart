import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomController extends GetxController{
  late PageController pageController;
  var currentIndex = 0.obs;
  GlobalKey bottomNavigationKey=GlobalKey();
  @override
  void onInit(){
    super.onInit();
    pageController=PageController();
  }
  @override
  void onReady(){
    super.onReady();

  }
  @override
  void onClose(){
    super.onClose();
    pageController.dispose();
  }
}