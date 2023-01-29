import 'package:get/get.dart';

import '../modules/product_detail/bindings/product_detail_binding.dart';
import '../modules/product_detail/views/product_detail_view.dart';
import '../modules/product_list/bindings/product_list_binding.dart';
import '../modules/product_list/views/product_list_view.dart';
import '../modules/serach/bindings/search_binding.dart';
import '../modules/serach/views/serach_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PRODUCT_DETAIL;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LIST,
      page: () => const ProductListView(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 100),
      page: () => const SerachView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
  ];
}
