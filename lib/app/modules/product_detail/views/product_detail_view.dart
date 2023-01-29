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
        preferredSize: Size.fromHeight(ScreenAdapter.height(120)),
        child: Obx(() => _appBar(context)),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          Container(
            key: controller.key1,
            alignment: Alignment.center,
            height: ScreenAdapter.height(1800),
            color: Colors.orange,
            child: const Text("商品"),
          ),
          Container(
            key: controller.key2,
            alignment: Alignment.center,
            height: ScreenAdapter.height(2900),
            color: Colors.blue,
            child: const Text("详情"),
          ),
          Container(
            key: controller.key3,
            alignment: Alignment.center,
            height: ScreenAdapter.height(3900),
            color: Colors.red,
            child: const Text("推荐"),
          ),
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
