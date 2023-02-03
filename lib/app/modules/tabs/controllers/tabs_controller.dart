import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:xmshop/app/modules/cart/views/cart_view.dart';
import 'package:xmshop/app/modules/category/views/category_view.dart';
import 'package:xmshop/app/modules/home/views/home_view.dart';
import 'package:xmshop/app/modules/service/views/service_view.dart';
import 'package:xmshop/app/modules/user/views/user_view.dart';

class TabsController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final List<Widget> pageList = const [HomeView(), CategoryView(), ServiceView(), CartView(), UserView()];
  final PageController pageController = PageController(initialPage: 0);

  void setCurrentIndex(index) {
    currentIndex.value = index;
    update();
  }
}
