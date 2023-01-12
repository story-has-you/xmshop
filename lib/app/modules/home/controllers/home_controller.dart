import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  RxBool flag = false.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      double pixels = scrollController.position.pixels;
      if (pixels > 10) {
        if (!flag.value) {
          flag.value = true;
        }
      }
      if (pixels < 10 && flag.value) {
        flag.value = false;
      }
      update();
    });
  }
}
