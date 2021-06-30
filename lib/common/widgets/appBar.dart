import 'package:doubanjiang_getx/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget myAppBar({
  double headerHeight = 84,
  Widget? title,
  PreferredSizeWidget? bottom,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(headerHeight.h),
    child: AppBar(
      elevation: 1,
      centerTitle: true,
      backgroundColor: AppColors.primaryBackground,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.dehaze,
          color: AppColors.primaryThemeColor,
          size: 52.sp,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.email_outlined,
            color: AppColors.primaryThemeColor,
            size: 52.sp,
          ),
        ),
      ],
      title: title,
      bottom: bottom,
    ),
  );
}
