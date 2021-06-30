import 'package:doubanjiang_getx/common/values/values.dart';
import 'package:doubanjiang_getx/pages/book_video_music/index.dart';
import 'package:doubanjiang_getx/pages/fair/index.dart';
import 'package:doubanjiang_getx/pages/group/index.dart';
import 'package:doubanjiang_getx/pages/home/index.dart';
import 'package:doubanjiang_getx/pages/profile/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<ApplicationController>();

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomePage(),
        BookVideoMusicPage(),
        GroupPage(),
        FairPage(),
        ProfilePage(),
      ],
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
    );
  }

  Widget _buildBottomNavigationBar() {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        brightness: Brightness.light,
      ),
      child: GetX<ApplicationController>(
        init: controller,
        initState: (_) {},
        builder: (_) {
          return BottomNavigationBar(
            items: controller.bottomTabs,
            currentIndex: controller.state.page,
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 12,
            selectedFontSize: 12,
            selectedItemColor: AppColors.primaryThemeColor,
            onTap: controller.handleNavBarTap,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
