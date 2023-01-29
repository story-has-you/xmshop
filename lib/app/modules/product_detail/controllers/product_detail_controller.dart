import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final RxDouble opcity = 0.0.obs;
  final List<dynamic> tabs = [
    {"id": 1, "title": "商品"},
    {"id": 2, "title": "详情"},
    {"id": 3, "title": "推荐"},
  ];

  final RxInt currentTabIndex = 1.obs;
  final RxBool showTab = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initScroll();
    update();
  }

  void setCurrentTabIndex(int index) {
    currentTabIndex.value = index;
    update();
  }

  _initScroll() {
    scrollController.addListener(() {
      double pixels = scrollController.position.pixels;
      if (pixels <= 100) {
        opcity.value = pixels / 100;
        if (showTab.value) {
          showTab.value = false;
        }
      } else if (!showTab.value) {
        showTab.value = true;
      }
    });
  }
}
