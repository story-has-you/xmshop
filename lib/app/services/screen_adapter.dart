import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static double width(num value) {
    return value.w;
  }

  static double height(num value) {
    return value.h;
  }

  static double fontSize(num value) {
    return value.sp;
  }

  static double getScreenWidth() {
    return 1.sw;
  }

  static double getScreenHeigt() {
    return 1.sh;
  }

  static double fontSize34() {
    return 34.sp;
  }
}
