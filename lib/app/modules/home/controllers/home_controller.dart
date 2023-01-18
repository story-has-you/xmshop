import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/apis/models/home/category_model.dart';
import 'package:xmshop/app/apis/models/home/focus_model.dart';
import 'package:xmshop/app/apis/models/home/plist_model.dart';
import 'package:xmshop/app/apis/request.dart';

class HomeController extends GetxController {
  final RxBool flag = false.obs;
  final RxList<FocusItem> swiperList = <FocusItem>[].obs;
  final RxList<FocusItem> bestSellingList = <FocusItem>[].obs;
  final RxList<CategoryItem> categoryList = <CategoryItem>[].obs;
  final RxList<PlistItem> bestSellingProductList = <PlistItem>[].obs;
  final RxList<PlistItem> waterfallsFlowList = <PlistItem>[].obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    _initScroll();
    _initData();
  }

  _initData() {
    _initSwiperList();
    _initCategory();
    _initBestSelling();
    _initBestSellingProduct();
    _initWaterfallsFlowList();
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

  _initBestSelling() async {
    var response = await request.fetch("/api/focus?postion=2");
    var focus = FocusModel.fromJson(response.data);
    bestSellingList.value = focus.result;
  }

  _initBestSellingProduct() async {
    var response = await request.fetch("/api/plist?is_hot=1");
    var list = PlistModel.fromJson(response.data);
    bestSellingProductList.value = list.result;
  }

  _initWaterfallsFlowList() async {
    var response = await request.fetch("/api/plist?is_best=1");
    var list = PlistModel.fromJson(response.data);
    waterfallsFlowList.value = list.result;
  }

  _initScroll() {
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
}
