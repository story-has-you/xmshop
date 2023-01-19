import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/apis/request.dart';
import 'package:xmshop/app/modules/category/controllers/category_controller.dart';
import 'package:xmshop/app/routes/app_pages.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: ScreenAdapter.width(840),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                child: const Icon(Icons.search),
              ),
              Text("手机", style: TextStyle(color: Colors.black54, fontSize: ScreenAdapter.fontSize(32)))
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.message_outlined, color: Colors.black45))],
        elevation: 0,
      ),
      body: Row(
        children: [
          // 左侧
          _left(),
          // 右侧
          _right(),
        ],
      ),
    );
  }

  Widget _left() {
    return SizedBox(
      width: ScreenAdapter.width(280),
      height: double.infinity,
      child: Obx(
        () => ListView.builder(
            itemCount: controller.categoryList.length,
            itemBuilder: (context, index) {
              var item = controller.categoryList[index];
              return SizedBox(
                width: double.infinity,
                height: ScreenAdapter.height(180),
                child: InkWell(
                  onTap: () => controller.changeIndex(index, item.id),
                  child: Obx(
                    () => Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: ScreenAdapter.width(10),
                            height: ScreenAdapter.height(140),
                            color: controller.selectIndex.value == index ? Colors.orange : Colors.white,
                          ),
                        ),
                        Center(
                          child: Text(
                            item.title,
                            style: TextStyle(fontSize: ScreenAdapter.fontSize34(), fontWeight: controller.selectIndex.value == index ? FontWeight.bold : FontWeight.normal),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _right() {
    return Expanded(
      child: SizedBox(
        height: double.infinity,
        child: Obx(
          () => GridView.builder(
            itemCount: controller.categoryDataList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: ScreenAdapter.width(40),
              mainAxisSpacing: ScreenAdapter.height(20),
              childAspectRatio: 240 / 340,
            ),
            itemBuilder: ((context, index) {
              var item = controller.categoryDataList[index];
              return Column(
                children: [
                  InkWell(
                    onTap: (() => Get.toNamed(Routes.PRODUCT_LIST, arguments: {"id": item.id})),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Image.network("${Request.baseUrl}/${item.pic}", fit: BoxFit.fitHeight),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(10), 0, 0),
                    child: Text(item.title, style: TextStyle(fontSize: ScreenAdapter.fontSize34())),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
