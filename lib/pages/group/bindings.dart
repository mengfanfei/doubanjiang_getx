import 'package:get/get.dart';

import 'controller.dart';

class GroupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupController>(() => GroupController());
  }
}
