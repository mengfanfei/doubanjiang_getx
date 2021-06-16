import 'package:doubanjiang_getx/common/utils/iconfont.dart';
import 'package:doubanjiang_getx/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ApplicationController extends GetxController {
  ApplicationController();

  /// 响应式成员变量

  final state = ApplicationState();

  /// 成员变量

  // 页控制器
  late final PageController pageController;

  late final List<BottomNavigationBarItem> bottomTabs;

  /// 事件

  // tap
  handleNavBarTap(int page) {
    pageController.jumpToPage(page);
  }

  // tab栏页码切换
  void handlePageChanged(int page) {
    state.page = page;
  }

  /// 生命周期

  ///在 widget 内存中分配后立即调用。
  ///你可以用它来为控制器初始化 initialize 一些东西。
  @override
  void onInit() {
    super.onInit();
    // new 对象
    // 初始静态数据
    bottomTabs = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          color: AppColors.primaryTextGray,
          size: 28,
        ),
        activeIcon: Icon(
          Icons.home,
          color: AppColors.primaryThemeColor,
          size: 28,
        ),
        label: '首页',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Iconfont.subject,
          color: AppColors.primaryTextGray,
          size: 24,
        ),
        activeIcon: Icon(
          Iconfont.subject2,
          color: AppColors.primaryThemeColor,
          size: 24,
        ),
        label: '书影音',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Iconfont.xiaozu,
          color: AppColors.primaryTextGray,
          size: 24,
        ),
        activeIcon: Icon(
          Iconfont.xiaozu3,
          color: AppColors.primaryThemeColor,
          size: 24,
        ),
        label: '小组',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Iconfont.shiji,
          color: AppColors.primaryTextGray,
          size: 20,
        ),
        activeIcon: Icon(
          Iconfont.shiji1,
          color: AppColors.primaryThemeColor,
          size: 20,
        ),
        label: '市集',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outlined,
          color: AppColors.primaryTextGray,
          size: 24,
        ),
        activeIcon: Icon(
          Icons.person,
          color: AppColors.primaryThemeColor,
          size: 24,
        ),
        label: '我的',
      ),
    ];

    pageController = PageController(initialPage: state.page);
  }

  ///在 onInit() 之后调用 1 帧。这是进入的理想场所
  ///导航事件，例如 snackbar、对话框或新route，或
  ///async 异步请求。
  @override
  void onReady() {
    super.onReady();
    // async 拉取数据
  }

  ///在 [onDelete] 方法之前调用。 [onClose] 可能用于
  ///处理控制器使用的资源。就像 closing events 一样，
  ///或在控制器销毁之前的流。
  ///或者处置可能造成一些内存泄漏的对象，
  ///像 TextEditingControllers、AnimationControllers。
  ///将一些数据保存在磁盘上也可能很有用。
  @override
  void onClose() {
    super.onClose();
    // 1 stop & close 关闭对象
    // 2 save 持久化数据
  }

  ///dispose 释放内存
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
    // dispose 释放对象
  }
}
