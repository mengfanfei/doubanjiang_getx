import 'package:doubanjiang_getx/pages/book_video_music/index.dart';
import 'package:doubanjiang_getx/pages/fair/index.dart';
import 'package:doubanjiang_getx/pages/group/index.dart';
import 'package:doubanjiang_getx/pages/home/index.dart';
import 'package:doubanjiang_getx/pages/profile/index.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<BookVideoMusicController>(() => BookVideoMusicController());
    Get.lazyPut<GroupController>(() => GroupController());
    Get.lazyPut<FairController>(() => FairController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
