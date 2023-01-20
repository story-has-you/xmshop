import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xmshop/app/routes/app_pages.dart';

void main() {
  //flutter 修改状态栏的颜色
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  runApp(ScreenUtilInit(
    // 填入设计稿中设备的屏幕尺寸,单位dp
    designSize: const Size(1080, 2400),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "XM SHOP",
        initialRoute: AppPages.INITIAL,
        theme: ThemeData(primarySwatch: Colors.grey),
        defaultTransition: Transition.rightToLeft,
        getPages: AppPages.routes,
      );
    },
  ));
}
