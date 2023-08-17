import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/custom_fonts/real_state_icons.dart';
import 'package:realstate/helper_widget/Text_widgets.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/constant.dart';

Widget waitListSingleRow(
   BuildContext context,
  String text1,
  String text2,
  IconData icon,
  iconcolor,
   
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: SizedBox(
          width: 52.w,
          child: Text(
            text1
            // model.userData.createdAt != null ?
            // AppUtil.formatDateMonth("august") + " "
            // : 'N/A'
            ,
            textAlign: TextAlign.end,
            style: AppTheme.lightTheme.textTheme.labelSmall!.copyWith(
              color: AppColors.black,
               fontSize: 12.h,
            ),
          ),
        ),
      ),
      SizedBox(width: 14.h),
     Icon(icon,
     size: 14.h,
     color:iconcolor
     ),
      // Icon(
      //   RealState.done,
      //   size: 14.h,
      // ),
      SizedBox(width: 14.h),
      Expanded(
        child: Text(
          text2,
          textAlign: TextAlign.start,
          style: AppTheme.lightTheme.textTheme.displaySmall!.copyWith(
            fontSize: 12.h,
          ),
        ),
      ),
    ],
  );
}

Widget waitListDivider(
  color 
) {
  return  Container(
          height: 70.h,
          child: Row(
            children: [
              const Expanded(child: SizedBox()),
              VerticalDivider(
          color: color,
          thickness: 1.h,
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        );
}
