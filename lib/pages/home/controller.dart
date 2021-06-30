import 'package:doubanjiang_getx/common/apis/apis.dart';
import 'package:doubanjiang_getx/common/entities/recommend.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  HomeController();

  /// 响应式成员变量

  final state = HomeState();

  /// 成员变量
  final List<Tab> titleTabs = <Tab>[
    Tab(
      text: '动态',
    ),
    Tab(
      text: '推荐',
    ),
  ];

  RecommendRequestEntity params = RecommendRequestEntity(page: 1);

  // 方法

  // 获取
  getRecommendList() async {
    state.recommendList = await RecommendAPI.recommendList(
      params: params,
      cacheDisk: true,
    );
    update();
  }

  // 加载更多
  void onLoading() async {
    params.page++;
    var response = await RecommendAPI.recommendList(
      params: params,
      cacheDisk: true,
    );
    state.recommendList.addAll(response);
    update();
    refreshController.loadComplete();
  }

  // 刷新
  void onRefresh() async {
    params.page = 1;
    var response = await RecommendAPI.recommendList(
      params: params,
      cacheDisk: true,
      refresh: true,
    );
    state.recommendList = response;
    update();
    refreshController.refreshCompleted();
  }

  // tab控制器
  late TabController tabController;

  // 下拉刷新控制器
  late RefreshController refreshController;

  /// 事件
  onTabChanged() {
    print('${tabController.index}, changed');
  }

  // tap
  handleTabClick(int index) {
    print('$index, click');
  }

  /// 生命周期

  ///在 widget 内存中分配后立即调用。
  ///你可以用它来为控制器初始化 initialize 一些东西。
  @override
  void onInit() {
    super.onInit();
    // new 对象
    // 初始静态数据
    tabController =
        TabController(initialIndex: state.index, length: 2, vsync: this);
    refreshController = RefreshController(initialRefresh: false);
    // 添加监听器
    tabController.addListener(() => onTabChanged());
    state.placeholder = '青岛大学';
  }

  ///在 onInit() 之后调用 1 帧。这是进入的理想场所
  ///导航事件，例如 snackbar、对话框或新route，或
  ///async 异步请求。
  @override
  void onReady() {
    super.onReady();
    // async 拉取数据

    getRecommendList();
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
    tabController.dispose();
    refreshController.dispose();
    super.dispose();
    // dispose 释放对象
  }
}
