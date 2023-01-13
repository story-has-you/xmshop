import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../home/views/home_view.dart';
import '../../category/views/category_view.dart';
import '../../service/views/service_view.dart';
import '../../cart/views/cart_view.dart';
import '../../user/views/user_view.dart';

class TabsController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final List<Widget> pageList = [HomeView(), CategoryView(), ServiceView(), CartView(), UserView()];
  final PageController pageController = PageController(initialPage: 0);

  void setCurrentIndex(index) {
    currentIndex.value = index;
    update();
  }
}
