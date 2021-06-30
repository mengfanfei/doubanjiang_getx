import 'package:doubanjiang_getx/pages/home/widgets/dynamic_state.dart';
import 'package:doubanjiang_getx/pages/home/widgets/recommend.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// hellowrod
class TabBarViewWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller.tabController,
      children: [
        DynamicStateWidget(),
        RecommendWidget(),
      ],
    );
  }
}
