import 'package:flutter/material.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_size.dart';
import 'package:realstate/utils/app_theme.dart';

Widget richText(String text1, String text2) {
  return RichText(
      text: TextSpan(
          style:AppTheme.lightTheme.textTheme.displaySmall!.copyWith(
            fontSize:AppSize.size12 ,
          ),  
          children: <TextSpan>[
         TextSpan(
            text: text1,
            style: const TextStyle(
              color: AppColors.codeExpire,
              fontWeight: FontWeight.w400,
            )),
        TextSpan(
            text: text2,
            style: const TextStyle(
              color: AppColors.timer,
              fontWeight: FontWeight.w500,
            )),
      ]));
}
