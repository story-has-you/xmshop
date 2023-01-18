import 'package:get/get.dart';
import 'package:xmshop/app/apis/models/category/category_model.dart';
import 'package:xmshop/app/apis/request.dart';

class CategoryController extends GetxController {
  final RxInt selectIndex = 0.obs;
  final RxList<CategoryItem> categoryList = <CategoryItem>[].obs;
  final RxList<CategoryItem> categoryDataList = <CategoryItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initCategoryList();
    update();
  }

  void changeIndex(int index, String id) {
    selectIndex.value = index;
    _initCategoryData(id);
    update();
  }

  _initCategoryList() async {
    var response = await request.fetch("/api/pcate");
    var data = CategoryModel.fromJson(response.data);
    categoryList.value = data.result;
    _initCategoryData(categoryList.value[0].id);
  }

  _initCategoryData(String pid) async {
    var response = await request.fetch("/api/pcate?pid=$pid");
    var data = CategoryModel.fromJson(response.data);
    categoryDataList.value = data.result;
  }
}
