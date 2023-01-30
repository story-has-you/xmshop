import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/product_detail/controllers/product_detail_controller.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

class RecommendPageView extends GetView {
  RecommendPageView({Key? key}) : super(key: key);

  @override
  final ProductDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.key3,
      alignment: Alignment.center,
      height: ScreenAdapter.height(3900),
      color: Colors.red,
      child: const Text("推荐"),
    );
  }
}
