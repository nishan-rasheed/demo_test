import 'package:demo_test/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {
   static  TextStyle titleHedingStyle = TextStyle(
    color: AppColor.textColorPrimary,
    fontSize:16.sp,
    fontWeight: FontWeight.w400,
  );
  static  TextStyle normalLargeStyle = TextStyle(
    color: AppColor.textColorPrimary,
    fontSize:14.sp,
    fontWeight: FontWeight.w500,
  );
  static  TextStyle normalSmallStyle = TextStyle(
    color: Colors.grey.shade500,
    fontSize:10.sp,
    fontWeight: FontWeight.w400,
  );
  static  TextStyle normalSmallStyleGreen = TextStyle(
    color: AppColor.primaryColor,
    fontSize:13.sp,
    fontWeight: FontWeight.w600,
  );
}