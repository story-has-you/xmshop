import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/controllers/cart_controller.dart';
import 'package:xmshop/app/modules/category/controllers/category_controller.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/modules/serach/controllers/serach_controller.dart';
import 'package:xmshop/app/modules/service/controllers/service_controller.dart';
import 'package:xmshop/app/modules/tabs/controllers/tabs_controller.dart';
import 'package:xmshop/app/modules/user/controllers/user_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(() => TabsController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<ServiceController>(() => ServiceController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<SerachController>(() => SerachController());
  }
}
