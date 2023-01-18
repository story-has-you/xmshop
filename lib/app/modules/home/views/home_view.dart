import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/apis/request.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/services/screen_adapter.dart';
import 'package:xmshop/app/services/swiper.dart';
import 'package:xmshop/app/services/xm_fonts.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          appBar(),
          homePage(),
        ],
      ),
    );
  }

  // 顶部导航
  Widget appBar() {
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
  Widget homePage() {
    return Positioned(
      top: -ScreenAdapter.height(150),
      left: 0,
      right: 0,
      bottom: 0,
      child: ListView(
        controller: scrollController,
        children: [
          _focus(),
          _banner(),
          _category(),
          _banner2(),
          _bestSelling(),
        ],
      ),
    );
  }

  Widget _category() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(470),
      child: Obx(
        () => Swiper(
          itemBuilder: (context, index) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: ScreenAdapter.width(20),
                mainAxisSpacing: ScreenAdapter.height(20),
              ),
              itemCount: 10,
              itemBuilder: ((context, i) {
                String picUrl = "${Request.baseUrl}/${controller.categoryList[index * 10 + i].pic}";
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: ScreenAdapter.width(140),
                      height: ScreenAdapter.height(140),
                      child: Image.network(
                        picUrl.replaceAll("\\", "/"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(5), 0, 0),
                      child: Text(controller.categoryList[index * 10 + i].title, style: TextStyle(fontSize: ScreenAdapter.fontSize34())),
                    ),
                  ],
                );
              }),
            );
          },
          itemCount: controller.categoryList.length ~/ 10,
          pagination: xmSwiperPagination(20),
        ),
      ),
    );
  }

  Widget _focus() {
    return Obx(
      () => SizedBox(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(682),
        child: Swiper(
          itemBuilder: (context, index) {
            String picUrl = "${Request.baseUrl}/${controller.swiperList[index].pic}";
            return Image.network(
              picUrl.replaceAll("\\", "/"),
              fit: BoxFit.fill,
            );
          },
          itemCount: controller.swiperList.length,
          pagination: xmSwiperPagination(50),
          autoplay: true,
          loop: true,
          duration: 1000,
        ),
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

  Widget _banner2() {
    return Padding(
      padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20), ScreenAdapter.height(20), ScreenAdapter.width(20), 0),
      child: Container(
        height: ScreenAdapter.height(420),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(image: AssetImage("assets/images/xiaomiBanner2.png"), fit: BoxFit.cover),
        ),
      ),
    );
  }

  // 热销甄选
  Widget _bestSelling() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(ScreenAdapter.width(30), ScreenAdapter.width(40), ScreenAdapter.width(30), ScreenAdapter.width(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("热销甄选", style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.fontSize(46))),
              Text("更多手机推荐 >", style: TextStyle(fontSize: ScreenAdapter.fontSize(38), color: Colors.grey)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20), 0, ScreenAdapter.width(20), ScreenAdapter.width(20)),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: ScreenAdapter.height(738),
                  child: Obx(
                    () => Swiper(
                      itemBuilder: (context, index) {
                        String picUrl = "${Request.baseUrl}/${controller.bestSellingList[index].pic}";
                        return Image.network(
                          picUrl.replaceAll("\\", "/"),
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: controller.bestSellingList.length,
                      autoplay: true,
                      loop: true,
                      duration: 1000,
                    ),
                  ),
                ),
              ),
              SizedBox(width: ScreenAdapter.width(20)),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: ScreenAdapter.height(738),
                  child: Obx(
                    () => Column(
                      children: controller.bestSellingProductList.asMap().entries.map((entry) {
                        var value = entry.value;
                        var key = entry.key;
                        var picUrl = "${Request.baseUrl}/${value.pic}";
                        return Expanded(
                          flex: 1,
                          child: Container(
                            color: const Color.fromRGBO(248, 248, 248, 1),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, key == 2 ? 0 : ScreenAdapter.height(20)),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      SizedBox(height: ScreenAdapter.height(20)),
                                      Text(value.title, style: TextStyle(fontSize: ScreenAdapter.fontSize(38), fontWeight: FontWeight.bold)),
                                      SizedBox(height: ScreenAdapter.height(20)),
                                      Text(value.subTitle, style: TextStyle(fontSize: ScreenAdapter.fontSize(28))),
                                      SizedBox(height: ScreenAdapter.height(20)),
                                      Text("${value.price}元", style: TextStyle(fontSize: ScreenAdapter.fontSize34())),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(ScreenAdapter.height(8)),
                                    child: Image.network(picUrl, fit: BoxFit.cover),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
