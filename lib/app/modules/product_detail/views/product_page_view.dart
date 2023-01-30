import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/apis/request.dart';
import 'package:xmshop/app/modules/product_detail/controllers/product_detail_controller.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

class ProductPageView extends GetView {
  @override
  final ProductDetailController controller = Get.find();
  final Function showBottomAttr;
  ProductPageView(this.showBottomAttr, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.productDetail.value.id == null) {
        return SizedBox(
          height: ScreenAdapter.height(2400),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      var productDetail = controller.productDetail.value;
      var url = Request.picUrl(productDetail.pic!);
      return Container(
        padding: EdgeInsets.all(ScreenAdapter.width(20)),
        key: controller.key1,
        alignment: Alignment.center,
        child: Column(
          children: [
            // 图片
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network(url),
            ),
            // 正副标题
            Container(
              padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
              child: Text(
                "${productDetail.title}",
                style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.fontSize(46)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
              child: Text(
                "${productDetail.subTitle}",
                style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.fontSize(34)),
              ),
            ),
            // 价格
            Container(
              padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text("价格: ", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("¥${productDetail.price}", style: TextStyle(color: Colors.red, fontSize: ScreenAdapter.fontSize(86))),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("原价: ", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("¥${productDetail.oldPrice}", style: TextStyle(color: Colors.black26, fontSize: ScreenAdapter.fontSize(46), decoration: TextDecoration.lineThrough)),
                    ],
                  )
                ],
              ),
            ),
            // 筛选
            Container(
              height: ScreenAdapter.height(100),
              padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
              child: InkWell(
                onTap: () {
                  showBottomAttr();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text("已选", style: TextStyle(fontWeight: FontWeight.bold)),
                        Padding(
                          padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
                          child: const Text("115，黑色，XL，1件"),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black38,
                      size: ScreenAdapter.fontSize(46),
                    )
                  ],
                ),
              ),
            ),
            // 送至
            Container(
              height: ScreenAdapter.height(100),
              padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
              child: InkWell(
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: ScreenAdapter.height(1200),
                      child: ListView(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(248, 255, 252, 252),
                            ),
                            margin: EdgeInsets.all(ScreenAdapter.width(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(ScreenAdapter.height(32)),
                                  child: Text("小米之家万达营业点", style: TextStyle(fontSize: ScreenAdapter.fontSize(52))),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(ScreenAdapter.height(32)),
                                    child: Text(
                                      "方塔路万达2012铺小米之家",
                                      style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                                    )),
                                Padding(
                                    padding: EdgeInsets.all(ScreenAdapter.height(32)),
                                    child: Text(
                                      "距离1.04km",
                                      style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                                    )),
                                Padding(
                                    padding: EdgeInsets.all(ScreenAdapter.height(32)),
                                    child: Text(
                                      "营业时间 9:00-23:00",
                                      style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(248, 255, 252, 252),
                            ),
                            margin: EdgeInsets.all(ScreenAdapter.width(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(ScreenAdapter.height(32)),
                                  child: Text("小米之家万达营业点", style: TextStyle(fontSize: ScreenAdapter.fontSize(52))),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(ScreenAdapter.height(32)),
                                    child: Text(
                                      "方塔路万达2012铺小米之家",
                                      style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                                    )),
                                Padding(
                                    padding: EdgeInsets.all(ScreenAdapter.height(32)),
                                    child: Text(
                                      "距离1.04km",
                                      style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                                    )),
                                Padding(
                                    padding: EdgeInsets.all(ScreenAdapter.height(32)),
                                    child: Text(
                                      "营业时间 9:00-23:00",
                                      style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(248, 255, 252, 252),
                            ),
                            margin: EdgeInsets.all(ScreenAdapter.width(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(ScreenAdapter.height(32)),
                                  child: Text("小米之家万达营业点", style: TextStyle(fontSize: ScreenAdapter.fontSize(52))),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(ScreenAdapter.height(32)),
                                    child: Text(
                                      "方塔路万达2012铺小米之家",
                                      style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                                    )),
                                Padding(
                                    padding: EdgeInsets.all(ScreenAdapter.height(32)),
                                    child: Text(
                                      "距离1.04km",
                                      style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                                    )),
                                Padding(
                                    padding: EdgeInsets.all(ScreenAdapter.height(32)),
                                    child: Text(
                                      "营业时间 9:00-23:00",
                                      style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text("门店", style: TextStyle(fontWeight: FontWeight.bold)),
                        Padding(
                          padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
                          child: const Text("小米之家"),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black38,
                      size: ScreenAdapter.fontSize(46),
                    )
                  ],
                ),
              ),
            ),
            // 服务
            Container(
              height: ScreenAdapter.height(100),
              padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
              child: InkWell(
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.height(32)),
                      height: ScreenAdapter.height(1000),
                      width: double.infinity,
                      color: Colors.white,
                      child: ListView(
                        children: const [
                          Text('''

    小米科技有限责任公司成立于2010年3月3日，是专注于智能硬件和电子产品研发的全球化移动互联网企业，同时也是一家专注于智能手机、智能电动汽车 [385]  、互联网电视及智能家居生态链建设的创新型科技企业。 [2-3]  小米公司创造了用互联网模式开发手机操作系统、发烧友参与开发改进的模式。

    “为发烧而生”是小米的产品概念。“让每个人都能享受科技的乐趣”是小米公司的愿景。小米公司应用了互联网开发模式开发产品，用极客精神做产品，用互联网模式干掉中间环节，致力让全球每个人，都能享用来自中国的优质科技产品。

    小米已经建成了全球最大消费类IoT物联网平台，连接超过4.78亿台智能设备，进入全球100多个国家和地区。 [4]  [314]  MIUI全球月活跃用户达到5.5亿 [384]  。小米系投资的公司超500家，覆盖智能硬件、生活消费用品、教育、游戏、社交网络、文化娱乐、医疗健康、汽车交通、金融等领域。

    ''')
                        ],
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text("服务 ", style: TextStyle(fontWeight: FontWeight.bold)),
                        Image.asset("assets/images/service.png"),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black38,
                      size: ScreenAdapter.fontSize(46),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
