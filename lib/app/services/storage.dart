import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static set(String key, List<String> value) async {
    var sp = await SharedPreferences.getInstance();
    sp.setStringList(key, value);
  }

  static Future<List<String>?> get(String key) async {
    var sp = await SharedPreferences.getInstance();
    if (!sp.containsKey(key)) {
      return null;
    }
    List<String>? resultList = sp.getStringList(key);
    return resultList ?? [];
  }

  static remove(String key) async {
    var sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  static clear() async {
    var sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
