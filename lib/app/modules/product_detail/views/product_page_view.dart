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
      padding: EdgeInsets.all(ScreenAdapter.width(20)),
      key: controller.key1,
      alignment: Alignment.center,
      child: Column(
        children: [
          // 图片
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.network("https://www.itying.com/images/flutter/p1.jpg"),
          ),
          // 正副标题
          Container(
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Text(
              "联想ThinkPad 翼480（0VCD） 英特尔酷睿i5 14英寸轻薄窄边框笔记本电脑",
              style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.fontSize(46)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Text(
              "震撼首发，15.9毫米全金属外观，4.9毫米轻薄窄边框，指纹电源按钮，杜比音效，2G独显，预装正版office软件",
              style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.fontSize(34)),
            ),
          ),
          // 价格
          Container(
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text("价格: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("¥128", style: TextStyle(color: Colors.red, fontSize: ScreenAdapter.fontSize(86))),
                  ],
                ),
                Row(
                  children: [
                    const Text("原价: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("¥158", style: TextStyle(color: Colors.black26, fontSize: ScreenAdapter.fontSize(46), decoration: TextDecoration.lineThrough)),
                  ],
                )
              ],
            ),
          ),
          // 筛选
          Container(
            height: ScreenAdapter.height(100),
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text("已选", style: TextStyle(fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
                      child: const Text("115，黑色，XL，1件"),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black38,
                  size: ScreenAdapter.fontSize(46),
                )
              ],
            ),
          ),
          // 送至
          Container(
            height: ScreenAdapter.height(100),
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text("门店", style: TextStyle(fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
                      child: const Text("小米之家"),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black38,
                  size: ScreenAdapter.fontSize(46),
                )
              ],
            ),
          ),
          // 服务
          Container(
            height: ScreenAdapter.height(100),
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text("服务 ", style: TextStyle(fontWeight: FontWeight.bold)),
                    Image.asset("assets/images/service.png"),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black38,
                  size: ScreenAdapter.fontSize(46),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
