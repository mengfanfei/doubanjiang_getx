import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// hellowrod
class HellowordWidget extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: controller.handleOpenApp,
        child: Text('进入应用'),
      ),
    );
  }
}
