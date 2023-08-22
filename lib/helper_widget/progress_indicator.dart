import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/utils/app_colors.dart';

Widget  buildProgressIndicator(

){
  return Padding(
    padding: EdgeInsets.only(left:80.h,right:80.h ,),
    child: LinearProgressIndicator(
      backgroundColor:AppColors.progressBackgroundColor.withOpacity(0.5) ,
      color: AppColors.primaryColor,
      valueColor:AlwaysStoppedAnimation(AppColors.black),
      minHeight:8.h,
      ),
  );
}
Widget  appbarProgressIndicator(
  
){
  return Padding(
    padding: EdgeInsets.only(left:80.h,right:80.h ,),
    child: LinearProgressIndicator(
      backgroundColor:AppColors.white.withOpacity(0.4) ,
      color: AppColors.primaryColor,
      valueColor:AlwaysStoppedAnimation(AppColors.white),
      minHeight:8.h,
      ),
  );
}