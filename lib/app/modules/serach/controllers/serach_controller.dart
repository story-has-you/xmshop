import 'package:get/get.dart';
import 'package:xmshop/app/services/search_service.dart';

class SerachController extends GetxController {
  String keywords = "";

  final RxList<String> historyList = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    getHistoryData();
  }

  void getHistoryData() async {
    var templateList = await SearchService.getHistoryRecord();
    if (templateList.isNotEmpty) {
      historyList.addAll(templateList);
      update();
    }
  }

  void clearHistoryData() async {
    await SearchService.removeAll();
  }
}
