import 'package:doubanjiang_getx/common/values/values.dart';
import 'package:doubanjiang_getx/common/widgets/widgets.dart';
import 'package:doubanjiang_getx/pages/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  PreferredSizeWidget _buildAppBar() {
    return myAppBar(
      headerHeight: 164,
      title: SizedBox(
        height: 84.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.inputBackground,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: AppColors.primaryTextGray,
                  size: 44.sp,
                ),
                Obx(
                  () => Text(
                    controller.state.placeholder,
                    style: TextStyle(
                      color: AppColors.primaryTextGray,
                      fontSize: 32.sp,
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: SizedBox(
          height: 80.h,
          child: Container(
            alignment: Alignment.bottomLeft,
            child: Theme(
              data: ThemeData(
                ///点击的背景高亮颜色
                highlightColor: Colors.transparent,

                ///点击水波纹颜色
                splashColor: Colors.transparent,
              ),
              child: TabBar(
                controller: controller.tabController,
                tabs: controller.titleTabs,
                isScrollable: true,
                labelColor: AppColors.primaryTextBlack,
                labelStyle: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: AppColors.primaryTextGray,
                unselectedLabelStyle: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                ),
                indicatorColor: AppColors.primaryTextBlack, //下划线颜色
                indicatorSize: TabBarIndicatorSize.label,
                onTap: controller.handleTabClick,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: Drawer(),
      body: TabBarViewWidget(),
    );
  }
}
