import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/services/screen_adapter.dart';
import 'package:xmshop/app/services/xm_fonts.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -ScreenAdapter.height(150),
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView.builder(
              controller: controller.scrollController,
              itemCount: 20,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return SizedBox(
                    width: ScreenAdapter.width(1080),
                    height: ScreenAdapter.height(682),
                    child: Image.network(
                      "https://www.itying.com/images/focus/focus02.png",
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  return ListTile(title: Text("第$index个列表"));
                }
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Obx(
              () => AppBar(
                title: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  width: controller.flag.value ? ScreenAdapter.width(800) : ScreenAdapter.width(620),
                  height: ScreenAdapter.height(96),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(230, 252, 243, 236),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                        child: Icon(Icons.search, color: controller.flag.value ? Colors.black87 : Colors.white),
                      ),
                      Text("手机",
                          style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(36),
                            color: controller.flag.value ? Colors.black87 : Colors.white,
                          )),
                    ],
                  ),
                ),
                centerTitle: true,
                // 透明效果
                backgroundColor: controller.flag.value ? Colors.white : Colors.transparent,
                // 去掉阴影
                elevation: 0,
                leadingWidth: controller.flag.value ? ScreenAdapter.width(20) : ScreenAdapter.width(120),
                leading: controller.flag.value ? const Text("") : const Icon(XmFonts.xiaomi, color: Colors.white),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.message)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
