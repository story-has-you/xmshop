import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/services/screen_adapter.dart';
import 'package:xmshop/app/services/swiper.dart';
import 'package:xmshop/app/services/xm_fonts.dart';

// 顶部导航
Widget appBar(HomeController controller) {
  return Positioned(
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
  );
}

// 内容区域
Widget homePage(HomeController controller, List<String> swiperList) {
  return Positioned(
    top: -ScreenAdapter.height(150),
    left: 0,
    right: 0,
    bottom: 0,
    child: ListView(
      controller: controller.scrollController,
      children: [
        _focus(swiperList),
        _banner(),
        SizedBox(
          width: ScreenAdapter.width(1080),
          height: ScreenAdapter.height(470),
          child: Swiper(
            itemBuilder: (context, index) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: ScreenAdapter.width(20),
                  mainAxisSpacing: ScreenAdapter.height(20),
                ),
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: ScreenAdapter.width(140),
                        height: ScreenAdapter.height(140),
                        child: Image.network(
                          "https://xiaomi.itying.com/public/upload/HYWKHxrKgE9O6zKajRTmb50B.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(5), 0, 0),
                        child: Text("电脑", style: TextStyle(fontSize: ScreenAdapter.fontSize34())),
                      ),
                    ],
                  );
                }),
              );
            },
            itemCount: 2,
            pagination: xmSwiperPagination(20),
          ),
        )
      ],
    ),
  );
}

Widget _focus(List<String> swiperList) {
  return SizedBox(
    width: ScreenAdapter.width(1080),
    height: ScreenAdapter.height(682),
    child: Swiper(
      itemBuilder: (context, index) {
        return Image.network(
          swiperList[index],
          fit: BoxFit.cover,
        );
      },
      itemCount: swiperList.length,
      pagination: xmSwiperPagination(50),
      autoplay: true,
      loop: true,
      duration: 1000,
    ),
  );
}

Widget _banner() {
  return SizedBox(
    width: ScreenAdapter.width(1080),
    height: ScreenAdapter.height(92),
    child: Image.asset(
      "assets/images/xiaomiBanner.png",
      fit: BoxFit.cover,
    ),
  );
}
