import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/apis/models/home/plist_model.dart';
import 'package:xmshop/app/apis/request.dart';

class ProductListController extends GetxController {
  int start = 1;
  final int limit = 10;
  final RxList<PlistItem> productList = <PlistItem>[].obs;
  final ScrollController scrollController = ScrollController();
  final RxBool hasData = true.obs;
  bool flag = true;
  GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey();
  String sort = "";
  String? keywords = Get.arguments["keywords"];
  String? cid = Get.arguments["id"];

  /*二级导航数据*/
  final List subHeaderList = [
    {"id": 1, "title": "综合", "fileds": "all", "sort": -1},
    {"id": 2, "title": "销量", "fileds": 'salecount', "sort": -1},
    {"id": 3, "title": "价格", "fileds": 'price', "sort": -1},
    {"id": 4, "title": "筛选"}
  ];
  // 选中的二级导航
  RxInt selectHeaderId = 1.obs;

  @override
  void onInit() {
    super.onInit();
    _initProductList();
    _initScrollController();
    update();
  }

  void _initScrollController() {
    scrollController.addListener(() {
      // 魂动条下拉的高度
      var pixels = scrollController.position.pixels;
      // 页面高度
      var maxScrollExtent = scrollController.position.maxScrollExtent;
      if (pixels > maxScrollExtent - 20) {
        _initProductList();
      }
    });
  }

  void _initProductList() async {
    if (flag && hasData.value) {
      flag = false;
      Map<String, dynamic> queryParameters = {
        "cid": cid,
        "page": start,
        "pageSize": limit,
        "sort": sort,
        "search": keywords,
      };
      var response = await request.fetch("/api/plist", queryParameters: queryParameters);
      var plistTemp = PlistModel.fromJson(response.data);
      //注意:拼接数据
      productList.addAll(plistTemp.result);
      start++;
      update();
      flag = true;
      if (plistTemp.result.length < limit) {
        hasData.value = false;
      }
    }
  }

  // 二级导航触发的方法
  void subHanderChange(int id) {
    selectHeaderId.value = id;
    if (id == 4) {
      scaffoldGlobalKey.currentState!.openEndDrawer();
      return;
    }
    // 改变排序
    var s = subHeaderList[id - 1]['sort'] = subHeaderList[id - 1]['sort'] * -1;
    sort = "${subHeaderList[id - 1]['fileds']}_$s}";
    // 重置page
    start = 1;
    productList.value = [];
    hasData.value = true;
    // 滚动条回到顶部
    scrollController.jumpTo(0);
    _initProductList();

    update();
  }
}
