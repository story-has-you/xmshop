import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  final ScrollController scrollController = ScrollController();

  final RxDouble opcity = 0.0.obs;

  _initScroll() {
    scrollController.addListener(() {
      double pixels = scrollController.position.pixels;
      if (pixels <= 100) {
        opcity.value = pixels / 100;
        update();
      }
    });
  }
}
