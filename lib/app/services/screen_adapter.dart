import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static width(num value) {
    return value.w;
  }

  static height(num value) {
    return value.h;
  }

  static fontSize(num value) {
    return value.sp;
  }

  static getScreenWidth() {
    return 1.sw;
  }

  static getScreenHeigt() {
    return 1.sh;
  }

  static fontSize34() {
    return 34.sp;
  }
}
