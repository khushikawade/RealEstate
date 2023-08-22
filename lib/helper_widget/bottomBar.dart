import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/custom_fonts/real_state_icons.dart';
import 'package:realstate/utils/app_colors.dart';

BottomBarWidget() {
  return Container(
      width: double.infinity,
      height: 70.h,
      color: AppColors.bottomBar,
      padding: EdgeInsets.only(
        left: 20.h,
        right: 20.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {},
              child: Icon(
                RealState.letter_unread,
                size: 24.h,
                color: AppColors.white,
              ),
            ),
          Expanded(
            child:Container() 
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              RealState.user_rounded,
              size: 24.h,
              color: AppColors.white,
            ),
          ),
        ],
      ));
}
