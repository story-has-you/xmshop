import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/product_detail/controllers/product_detail_controller.dart';
import 'package:xmshop/app/modules/product_detail/views/detail_page_view.dart';
import 'package:xmshop/app/modules/product_detail/views/product_page_view.dart';
import 'package:xmshop/app/modules/product_detail/views/recommend_page_view.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 让内容区域扩展到appBar, 实现透明导航
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenAdapter.height(120)),
        child: Obx(() => _appBar(context)),
      ),
      body: Stack(children: [_body(), _bottom()]),
    );
  }

  void showBottomAttr() {
    // Get.bottomSheet 需要使用 GetBuilder 才能更新页面数据
    Get.bottomSheet(GetBuilder<ProductDetailController>(
      init: controller,
      builder: (controller) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(ScreenAdapter.width(20)),
          width: double.infinity,
          height: ScreenAdapter.height(1200),
          child: ListView(
            children: controller.properties.map((p) {
              return Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: ScreenAdapter.height(20), left: ScreenAdapter.width(20)),
                    width: ScreenAdapter.width(1040),
                    child: Text(p.cate, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: ScreenAdapter.height(20), left: ScreenAdapter.width(20)),
                    width: ScreenAdapter.width(1040),
                    child: Wrap(
                      children: p.list.map((v) {
                        return InkWell(
                          onTap: () => controller.checked(p, v),
                          child: Container(
                            margin: EdgeInsets.all(ScreenAdapter.width(20)),
                            child: Chip(
                              padding: EdgeInsets.only(left: ScreenAdapter.width(20), right: ScreenAdapter.width(20)),
                              backgroundColor: v.checked ? Colors.red : const Color.fromARGB(31, 223, 213, 213),
                              label: Text(v.title),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
    ));
  }

  Widget _bottom() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: ScreenAdapter.height(180),
        decoration: BoxDecoration(
          color: Colors.white,
          // 上面的线
          border: Border(top: BorderSide(width: ScreenAdapter.width(2), color: Colors.black)),
        ),
        child: Row(children: [
          Container(
            margin: EdgeInsets.only(left: ScreenAdapter.width(40)),
            height: ScreenAdapter.height(160),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.support_agent),
                Text("客服", style: TextStyle(fontSize: ScreenAdapter.fontSize(32))),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenAdapter.width(40)),
            height: ScreenAdapter.height(160),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.favorite),
                Text("收藏", style: TextStyle(fontSize: ScreenAdapter.fontSize(32))),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenAdapter.width(40)),
            height: ScreenAdapter.height(160),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_cart),
                Text("购物车", style: TextStyle(fontSize: ScreenAdapter.fontSize(32))),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: ScreenAdapter.height(120),
              margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
              child: ElevatedButton(
                onPressed: () {
                  showBottomAttr();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 165, 0, 0.9)),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text("加入购物车"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: ScreenAdapter.height(120),
              margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
              child: ElevatedButton(
                onPressed: () {
                  showBottomAttr();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(253, 1, 0, 0.9)),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text("立即购买"),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          ProductPageView(showBottomAttr),
          DetailPageView(),
          RecommendPageView(),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: ScreenAdapter.width(88),
          height: ScreenAdapter.height(88),
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
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
          child: controller.showTab.value
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: controller.tabs.map((e) {
                    var id = e['id'];
                    var title = e['title'];
                    return InkWell(
                      onTap: () {
                        controller.setCurrentTabIndex(id);
                        Duration duration = const Duration(seconds: 1);
                        // 跳转到指定的容器
                        switch (id) {
                          case 1:
                            Scrollable.ensureVisible(controller.key1.currentContext as BuildContext, duration: duration);
                            break;
                          case 2:
                            Scrollable.ensureVisible(controller.key2.currentContext as BuildContext, duration: duration);
                            break;
                          case 3:
                            Scrollable.ensureVisible(controller.key3.currentContext as BuildContext, duration: duration);
                            break;
                          default:
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(title, style: TextStyle(fontSize: ScreenAdapter.fontSize(36))),
                          Container(
                            margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
                            width: ScreenAdapter.width(100),
                            height: ScreenAdapter.height(2),
                            color: id == controller.currentTabIndex.value ? Colors.red : Colors.transparent,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )
              : const Text("")),
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
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(ScreenAdapter.width(800), ScreenAdapter.height(220), ScreenAdapter.width(20), 0),
                items: [
                  PopupMenuItem(
                    child: Row(
                      children: const [Icon(Icons.home, color: Colors.white), Text("首页", style: TextStyle(color: Colors.white))],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: const [Icon(Icons.message, color: Colors.white), Text("消息", style: TextStyle(color: Colors.white))],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: const [Icon(Icons.star, color: Colors.white), Text("收藏", style: TextStyle(color: Colors.white))],
                    ),
                  )
                ],
              );
            },
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
