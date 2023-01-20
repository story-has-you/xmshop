import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/serach/controllers/serach_controller.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

class SerachView extends GetView<SerachController> {
  const SerachView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.height(40)),
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "搜索历史",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenAdapter.fontSize34(),
                  ),
                ),
                const Icon(Icons.delete_forever)
              ],
            ),
          ),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(ScreenAdapter.height(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: const Text("手机"),
              )
            ],
          ),

          const SizedBox(height: 20),
          // 热销商品
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: ScreenAdapter.height(138),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/hot_search.png")),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(ScreenAdapter.width(20)),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: ScreenAdapter.width(40),
                mainAxisSpacing: ScreenAdapter.height(20),
                childAspectRatio: 3 / 1,
              ),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      width: ScreenAdapter.width(120),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(ScreenAdapter.width(10)),
                      child: Image.network("https://www.itying.com/images/shouji.png", fit: BoxFit.fitHeight),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Text("123"),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Container(
        width: ScreenAdapter.width(840),
        height: ScreenAdapter.height(96),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(246, 246, 246, 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          // 自动聚焦
          autofocus: true,
          style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: [
        TextButton(
          onPressed: () {},
          child: Text("搜索", style: TextStyle(fontSize: ScreenAdapter.fontSize(36), color: Colors.black54)),
        )
      ],
      elevation: 0,
    );
  }
}
