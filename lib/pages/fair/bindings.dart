import 'package:get/get.dart';

import 'controller.dart';

class FairBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FairController>(() => FairController());
  }
}
