import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/screen_adapter.dart';
import 'package:xmshop/app/modules/product_detail/controllers/product_detail_controller.dart';

class DetailPageView extends GetView {
  DetailPageView(this.subHeader, {Key? key}) : super(key: key);

  @override
  final ProductDetailController controller = Get.find();
  final Function subHeader;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.key2,
      alignment: Alignment.center,
      child: Column(
        children: [
          subHeader(),
          Obx(
            () => controller.selectedTabsIndex.value == 1
                ? SizedBox(
                    width: ScreenAdapter.height(1080),
                    child: Html(
                      data: controller.productDetail.value.content,
                      style: {
                        "body": Style(backgroundColor: Colors.white),
                        "p": Style(fontSize: FontSize.large),
                      },
                    ),
                  )
                : SizedBox(
                    width: ScreenAdapter.height(1080),
                    child: Html(
                      data: controller.productDetail.value.specs,
                      style: {
                        "body": Style(backgroundColor: Colors.white),
                        "p": Style(fontSize: FontSize.large),
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
