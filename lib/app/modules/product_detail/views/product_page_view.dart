import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/product_detail/controllers/product_detail_controller.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

class ProductPageView extends GetView {
  ProductPageView({Key? key}) : super(key: key);

  @override
  final ProductDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.key1,
      alignment: Alignment.center,
      height: ScreenAdapter.height(1800),
      color: Colors.orange,
      child: const Text("商品"),
    );
  }
}
