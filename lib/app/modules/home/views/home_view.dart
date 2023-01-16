import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          controller.appBar(),
          controller.homePage(),
        ],
      ),
    );
  }
}
