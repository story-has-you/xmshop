import 'package:xmshop/app/services/storage.dart';

class SearchService {
  // 保存历史搜索记录
  static void setHistoryRecord(String keywords) async {
    List<String>? searchHistories = await Storage.get("search_history");
    if (searchHistories == null) {
      List<String> tempList = [];
      tempList.add(keywords);
      await Storage.set("search_history", tempList);
    } else {
      var hasData = searchHistories.any((value) => value == keywords);
      if (!hasData) {
        searchHistories.add(keywords);
        await Storage.set("search_history", searchHistories);
      }
    }
  }

  // 获取历史搜索记录
  static Future<List<String>> getHistoryRecord() async {
    List<String>? searchHistories = await Storage.get("search_history");
    return searchHistories ?? [];
  }

  // 删除搜索记录
  static void removeHistoryRecord(String keywords) async {
    List<String>? searchHistories = await Storage.get("search_history");
    if (searchHistories != null) {
      searchHistories.remove(keywords);
      await Storage.set("search_history", searchHistories);
    }
  }

  // 清空搜索记录
  static removeAll() async {
    await Storage.clear();
  }
}
