import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/screen_adapter.dart';
import 'package:xmshop/app/modules/product_detail/controllers/product_detail_controller.dart';

class DetailPageView extends GetView {
  DetailPageView({Key? key}) : super(key: key);

  @override
  final ProductDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.key2,
      alignment: Alignment.center,
      height: ScreenAdapter.height(2900),
      color: Colors.blue,
      child: const Text("详情"),
    );
  }
}
