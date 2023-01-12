import 'package:get/get.dart';
import 'package:xmshop/app/modules/tabs/views/tabs_view.dart';

import '../modules/tabs/bindings/tabs_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
  ];
}
