import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

SwiperPagination xmSwiperPagination(num height) {
  return SwiperPagination(
    margin: const EdgeInsets.all(0.0),
    builder: SwiperCustomPagination(builder: (context, config) {
      return ConstrainedBox(
        constraints: BoxConstraints.expand(height: ScreenAdapter.height(height)),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: const RectSwiperPaginationBuilder(
                  color: Colors.black12,
                  activeColor: Colors.black54,
                ).build(context, config),
              ),
            ),
          ],
        ),
      );
    }),
  );
}
