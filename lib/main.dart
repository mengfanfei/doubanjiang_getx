import 'package:doubanjiang_getx/common/routes/app_pages.dart';
import 'package:doubanjiang_getx/common/services/global_config.dart';
import 'package:doubanjiang_getx/common/utils/logger.dart';
import 'package:doubanjiang_getx/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  print('starting services ...');
  await Get.putAsync(() => GlobalConfigService().init());
  await Global.init();
  print('All services started ...');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,

        // 日志
        enableLog: true,
        logWriterCallback: Logger.write,

        // 路由
        getPages: AppPages.routes,

        // 启动页面
        initialRoute: AppPages.INITIAL,
      ),
    );
  }
}
