import 'package:doubanjiang_getx/common/entities/entities.dart';
import 'package:doubanjiang_getx/common/values/values.dart';
import 'package:doubanjiang_getx/common/widgets/widgets.dart';
import 'package:doubanjiang_getx/pages/home/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RecommendWidget extends GetView<HomeController> {
  // 头部
  Widget _buildHeader(RecommendResponseEntity item) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryTextGray,
            ),
            child: netImageCached(
              item.authorPhoto,
              width: 60.w,
              height: 60.w,
              borderRadius: BorderRadius.all(Radius.circular(30.w)),
            ),
          ),
          Text(
            item.author,
            style: TextStyle(
              color: AppColors.primaryTextBlack,
              fontSize: 28.sp,
              fontWeight: FontWeight.normal,
              fontFamily: 'Avenir',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          Icon(
            Icons.more_horiz,
            color: AppColors.primaryTextGray,
          ),
        ],
      ),
    );
  }

  Widget _buildTopic(RecommendResponseEntity item) {
    return item.topic == null
        ? Container()
        : Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: Radii.k20pxRadius,
              color: AppColors.inputBackground,
            ),
            child: Text(
              item.topic!,
              style: TextStyle(
                color: AppColors.primaryThemeColor,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
            ),
          );
  }

  Widget _buildContent(RecommendResponseEntity item) {
    return item.content == null
        ? Container()
        : Container(
            margin: EdgeInsets.only(top: 20.h),
            child: Text(
              item.content!,
              style: TextStyle(
                color: AppColors.primaryTextBlack,
                fontFamily: 'Avenir',
                fontSize: 32.sp,
                fontWeight: FontWeight.normal,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          );
  }

  Widget _buildPic(RecommendResponseEntity item) {
    return item.images == null
        ? Container()
        : Container(
            margin: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: item.images!
                  .map(
                    (e) => netImageCached(
                      e,
                      width: 220.w,
                      height: 220.w,
                      borderRadius: Radii.k12pxRadius,
                    ),
                  )
                  .toList(),
            ),
          );
  }

  Widget _buildBottom(RecommendResponseEntity item) {
    return Container(
      height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.thumb_up_off_alt,
                  size: 48.w,
                  color: AppColors.primaryTextGray,
                ),
                Text(
                  item.likeCount == 0 ? '点赞' : '${item.likeCount}',
                  style: TextStyle(
                    color: AppColors.primaryTextGray,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.messenger_outline_rounded,
                  size: 48.w,
                  color: AppColors.primaryTextGray,
                ),
                Text(
                  item.messageCount == 0 ? '评论' : '${item.messageCount}',
                  style: TextStyle(
                    color: AppColors.primaryTextGray,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.share_rounded,
                  size: 48.w,
                  color: AppColors.primaryTextGray,
                ),
                Text(
                  item.shareCount == 0 ? '分享' : '${item.shareCount}',
                  style: TextStyle(
                    color: AppColors.primaryTextGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        return _.state.recommendList == null
            ? CupertinoActivityIndicator()
            : SmartRefresher(
                controller: controller.refreshController,
                enablePullDown: true,
                enablePullUp: true,
                onLoading: _.onLoading,
                onRefresh: _.onRefresh,
                header: WaterDropHeader(),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text("pull up load");
                    } else if (mode == LoadStatus.loading) {
                      body = CupertinoActivityIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Load Failed!Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("release to load more");
                    } else {
                      body = Text("No more Data");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                child: ListView.builder(
                  itemCount: _.state.recommendList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBackground,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildHeader(_.state.recommendList[index]),
                              _buildTopic(_.state.recommendList[index]),
                              _buildContent(_.state.recommendList[index]),
                              _buildPic(_.state.recommendList[index]),
                              _buildBottom(_.state.recommendList[index]),
                            ],
                          ),
                        ),
                        Container(
                          height: 20.h,
                          color: AppColors.secondBackground,
                        ),
                      ],
                    );
                  },
                ),
              );
      },
    );
  }
}
