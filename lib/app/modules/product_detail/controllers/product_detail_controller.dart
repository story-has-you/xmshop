import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/apis/models/product/product_model.dart';
import 'package:xmshop/app/apis/request.dart';

class ProductDetailController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final RxDouble opcity = 0.0.obs;
  final List<dynamic> tabs = [
    {"id": 1, "title": "商品"},
    {"id": 2, "title": "详情"},
    {"id": 3, "title": "推荐"},
  ];

  final RxInt currentTabIndex = 1.obs;
  final RxBool showTab = false.obs;
  final GlobalKey key1 = GlobalKey();
  final GlobalKey key2 = GlobalKey();
  final GlobalKey key3 = GlobalKey();

  var productDetail = ProductDetail().obs;
  final RxList<Property> properties = <Property>[].obs;
  RxString checkedValue = "".obs;

  @override
  void onInit() {
    super.onInit();
    _initScroll();
    _initPoductDetail();
  }

  void setCurrentTabIndex(int index) {
    currentTabIndex.value = index;
    update();
  }

  void _initPoductDetail() async {
    String productId = Get.arguments["productId"];
    var response = await request.fetch("/api/pcontent?id=$productId");
    var data = ProductDetailModel.fromJson(response.data);
    productDetail.value = data.result;
    properties.value = transAttr(productDetail.value.attr!);
    update();
  }

  List<Property> transAttr(List<Attr> attr) {
    return attr.map((a) {
      var cate = a.cate;
      var propertyValueList = a.list.map((a) => PropertyValue(title: a, checked: false)).toList();
      return Property(cate: cate, list: propertyValueList);
    }).toList();
  }

  void updateCheckedProperty() {
    checkedValue.value = "";
    for (var property in properties) {
      for (var propertyValue in property.list) {
        if (propertyValue.checked) {
          checkedValue.value += "${property.cate}：${propertyValue.title}；";
        }
      }
    }
  }

  void _initScroll() async {
    scrollController.addListener(() {
      double pixels = scrollController.position.pixels;
      if (pixels < 0) {
        return;
      }
      if (pixels <= 100) {
        opcity.value = pixels / 100;
        if (showTab.value) {
          showTab.value = false;
        }
      } else if (!showTab.value) {
        showTab.value = true;
      }
    });
  }

  void checked(Property p, PropertyValue v) {
    for (var value in p.list) {
      value.checked = value.title == v.title;
    }
    updateCheckedProperty();
    update();
  }
}

class Property {
  Property({required this.cate, required this.list});
  late final String cate;
  late final List<PropertyValue> list;
}

class PropertyValue {
  PropertyValue({required this.title, required this.checked});
  late final String title;
  late bool checked;
}
