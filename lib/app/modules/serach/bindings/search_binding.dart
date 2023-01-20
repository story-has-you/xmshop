import 'package:get/get.dart';
import 'package:xmshop/app/modules/serach/controllers/serach_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SerachController>(
      () => SerachController(),
    );
  }
}
