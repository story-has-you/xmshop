import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/modules/home/views/home_widget.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final List<String> swiperList = [
    "https://www.itying.com/images/focus/focus01.png",
    "https://www.itying.com/images/focus/focus02.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          appBar(controller),
          homePage(controller, swiperList),
        ],
      ),
    );
  }
}
