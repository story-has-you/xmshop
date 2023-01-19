import 'package:flutter/widgets.dart';
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
      var response = await request.fetch("/api/plist?cid=${Get.arguments["id"]}&page=$start&pageSize=$limit");
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
}
