import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/controllers/cart_controller.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            children: [],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: ScreenAdapter.width(20), right: ScreenAdapter.width(20)),
              width: double.infinity,
              height: ScreenAdapter.height(190),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black12,
                    width: ScreenAdapter.height(2),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      const Text("全选"),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("合计:"),
                      Text(
                        "111",
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(38), color: Colors.red),
                      ),
                      SizedBox(width: ScreenAdapter.width(20)),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 165, 0, 0.9)),
                        ),
                        onPressed: () {},
                        child: const Text("结算"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
