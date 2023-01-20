import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/apis/request.dart';
import 'package:xmshop/app/modules/product_list/controllers/product_list_controller.dart';
import 'package:xmshop/app/routes/app_pages.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);
//自定义组件
  Widget _progressIndicator() {
    if (controller.hasData.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return const Center(
        child: Text("没有数据了哦，我是有底线的"),
      );
    }
  }

  Widget _productListWidget() {
    return Obx(
      () => controller.productList.isNotEmpty
          ? ListView.builder(
              controller: controller.scrollController,
              padding: EdgeInsets.fromLTRB(ScreenAdapter.width(26), ScreenAdapter.width(140), ScreenAdapter.width(26), ScreenAdapter.height(26)),
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                var item = controller.productList[index];
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: ScreenAdapter.height(26)),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      //行
                      child: Row(
                        children: [
                          //左侧
                          Container(
                            padding: EdgeInsets.all(ScreenAdapter.width(60)),
                            width: ScreenAdapter.width(400),
                            height: ScreenAdapter.height(460),
                            child: Image.network(Request.picUrl(item.pic), fit: BoxFit.fitHeight),
                          ),
                          //右侧
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
                                  child: Text(item.title, style: TextStyle(fontSize: ScreenAdapter.fontSize(42), fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
                                  child: Text(item.subTitle, style: TextStyle(fontSize: ScreenAdapter.fontSize(34))),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text("CUP", style: TextStyle(fontSize: ScreenAdapter.fontSize(34), fontWeight: FontWeight.bold)),
                                            Text("Helio G25",
                                                style: TextStyle(
                                                  fontSize: ScreenAdapter.fontSize(34),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text("高清拍摄", style: TextStyle(fontSize: ScreenAdapter.fontSize(34), fontWeight: FontWeight.bold)),
                                            Text("1300万像素",
                                                style: TextStyle(
                                                  fontSize: ScreenAdapter.fontSize(34),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text("超大屏", style: TextStyle(fontSize: ScreenAdapter.fontSize(34), fontWeight: FontWeight.bold)),
                                            Text("6.1寸",
                                                style: TextStyle(
                                                  fontSize: ScreenAdapter.fontSize(34),
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text("￥${item.price}起", style: TextStyle(fontSize: ScreenAdapter.fontSize(38), fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    (index == controller.productList.length - 1) ? _progressIndicator() : const Text("")
                  ],
                );
              },
            )
          : _progressIndicator(),
    );
  }

  Widget _subHeaderWidget() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Obx(
        () => Container(
          height: ScreenAdapter.height(120),
          width: ScreenAdapter.width(1080),
          decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(width: ScreenAdapter.height(2), color: const Color.fromRGBO(233, 233, 233, 0.9)))),
          child: Row(
            children: controller.subHeaderList.map((e) {
              return Expanded(
                flex: 1,
                child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                    child: Text(
                      "${e['title']}",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: controller.selectHeaderId == e['id'] ? Colors.red : Colors.black, fontSize: ScreenAdapter.fontSize(32)),
                    ),
                  ),
                  onTap: () => controller.subHanderChange(e['id']),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldGlobalKey,
      endDrawer: const Drawer(child: Text("右侧筛选")),
      appBar: AppBar(
        title: Container(
          width: ScreenAdapter.width(900),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.SEARCH, arguments: {"keywords": ""});
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                  child: const Icon(Icons.search),
                ),
                Text("${controller.keywords}", style: TextStyle(color: Colors.black54, fontSize: ScreenAdapter.fontSize(32)))
              ],
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        // 覆盖抽屉组件
        actions: const [Text("")],
      ),
      body: Stack(
        children: [_productListWidget(), _subHeaderWidget()],
      ),
    );
  }
}
