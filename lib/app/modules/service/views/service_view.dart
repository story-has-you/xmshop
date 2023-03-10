import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/service/controllers/service_controller.dart';

class ServiceView extends GetView<ServiceController> {
  const ServiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ServiceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ServiceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
