import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/apis/models/home/category_model.dart';
import 'package:xmshop/app/apis/models/home/focus_model.dart';
import 'package:xmshop/app/apis/request.dart';
import 'package:xmshop/app/services/screen_adapter.dart';
import 'package:xmshop/app/services/swiper.dart';
import 'package:xmshop/app/services/xm_fonts.dart';

class HomeController extends GetxController {
  final RxBool flag = false.obs;
  final RxList<FocusItem> swiperList = <FocusItem>[].obs;
  final RxList<CategoryItem> categoryList = <CategoryItem>[].obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    initScroll();
    initData();
  }

  initData() {
    _initSwiperList();
    _initCategory();
    update();
  }

  _initSwiperList() async {
    var response = await request.fetch("/api/focus");
    var focus = FocusModel.fromJson(response.data);
    swiperList.value = focus.result;
  }

  _initCategory() async {
    var response = await request.fetch("/api/bestCate");
    var category = CategoryModel.fromJson(response.data);
    categoryList.value = category.result;
  }

  initScroll() {
    scrollController.addListener(() {
      double pixels = scrollController.position.pixels;
      if (pixels > 10) {
        if (!flag.value) {
          flag.value = true;
        }
      }
      if (pixels < 10 && flag.value) {
        flag.value = false;
      }
      update();
    });
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
            width: flag.value ? ScreenAdapter.width(800) : ScreenAdapter.width(620),
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
                  child: Icon(Icons.search, color: flag.value ? Colors.black87 : Colors.white),
                ),
                Text("手机",
                    style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(36),
                      color: flag.value ? Colors.black87 : Colors.white,
                    )),
              ],
            ),
          ),
          centerTitle: true,
          // 透明效果
          backgroundColor: flag.value ? Colors.white : Colors.transparent,
          // 去掉阴影
          elevation: 0,
          leadingWidth: flag.value ? ScreenAdapter.width(20) : ScreenAdapter.width(120),
          leading: flag.value ? const Text("") : const Icon(XmFonts.xiaomi, color: Colors.white),
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
                String picUrl = "${Request.baseUrl}/${categoryList[index * 10 + i].pic}";
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
                      child: Text(categoryList[index * 10 + i].title, style: TextStyle(fontSize: ScreenAdapter.fontSize34())),
                    ),
                  ],
                );
              }),
            );
          },
          itemCount: categoryList.length ~/ 10,
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
            String picUrl = "${Request.baseUrl}/${swiperList[index].pic}";
            return Image.network(
              picUrl.replaceAll("\\", "/"),
              fit: BoxFit.fill,
            );
          },
          itemCount: swiperList.length,
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
}
