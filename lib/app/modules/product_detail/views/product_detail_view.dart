import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/product_detail/controllers/product_detail_controller.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 让内容区域扩展到appBar, 实现透明导航
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenAdapter.height(96)),
        child: Obx(() => _appBar()),
      ),
      body: Center(
        child: Text(
          'ProductDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: ScreenAdapter.width(88),
          height: ScreenAdapter.height(88),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              // 去掉butten的默认padding
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              backgroundColor: MaterialStateProperty.all(Colors.black12),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              // 形状-> 圆形
              shape: MaterialStateProperty.all(const CircleBorder()),
              alignment: Alignment.center,
            ),
            child: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
      ),
      title: SizedBox(
        width: ScreenAdapter.width(400),
        height: ScreenAdapter.height(96),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("商品", style: TextStyle(fontSize: ScreenAdapter.fontSize(36))),
                  Container(
                    margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
                    width: ScreenAdapter.width(100),
                    height: ScreenAdapter.height(2),
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("详情", style: TextStyle(fontSize: ScreenAdapter.fontSize(36))),
                  Container(
                    margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
                    width: ScreenAdapter.width(100),
                    height: ScreenAdapter.height(2),
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("推荐", style: TextStyle(fontSize: ScreenAdapter.fontSize(36))),
                  Container(
                    margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
                    width: ScreenAdapter.width(100),
                    height: ScreenAdapter.height(2),
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white.withOpacity(controller.opcity.value),
      elevation: 0,
      actions: [
        Container(
          margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
          width: ScreenAdapter.width(88),
          height: ScreenAdapter.height(88),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              // 去掉butten的默认padding
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              backgroundColor: MaterialStateProperty.all(Colors.black12),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              // 形状-> 圆形
              shape: MaterialStateProperty.all(const CircleBorder()),
              alignment: Alignment.center,
            ),
            child: const Icon(Icons.ios_share),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
          width: ScreenAdapter.width(88),
          height: ScreenAdapter.height(88),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              // 去掉butten的默认padding
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              backgroundColor: MaterialStateProperty.all(Colors.black12),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              // 形状-> 圆形
              shape: MaterialStateProperty.all(const CircleBorder()),
              alignment: Alignment.center,
            ),
            child: const Icon(Icons.more_horiz),
          ),
        ),
      ],
    );
  }
}
