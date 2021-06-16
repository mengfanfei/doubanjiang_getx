import 'package:doubanjiang_getx/common/routes/app_pages.dart';
import 'package:doubanjiang_getx/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  RouteSettings? redirect(String? route) {
    if (Global.isFirstOpen == true) {
      return null;
    } else {
      return RouteSettings(name: AppRoutes.Application);
    }
  }
}
