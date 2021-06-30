import 'package:get/get.dart';

import 'controller.dart';

class BookVideoMusicBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookVideoMusicController>(() => BookVideoMusicController());
  }
}
