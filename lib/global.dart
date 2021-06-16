import 'package:doubanjiang_getx/common/utils/http.dart';
import 'package:doubanjiang_getx/common/utils/storage.dart';
import 'package:flutter/material.dart';

import 'common/values/values.dart';

class Global {
  /// 用户配置
  ///
  /// /// 是否第一次打开
  static bool? isFirstOpen;

  /// 是否离线登录
  static bool isOfflineLogin = false;

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    await StorageUtil().init();
    HttpUtil();

    // 读取设备第一次打开
    isFirstOpen = StorageUtil().getBool(STORAGE_DEVICE_FIRST_OPEN_KEY);
    if (isFirstOpen == null) {
      isFirstOpen = true;
    }
  }

  // 保存用户已打开APP
  static saveAlreadyOpen() {
    StorageUtil().setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, false);
  }
}
