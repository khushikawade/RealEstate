import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_size.dart';
import 'package:realstate/utils/app_theme.dart';

Widget otpRichText(
  String text1,
  String text2, 
  Function? onTap1,
  Function? onTap2,
) {
  return RichText(
      text: TextSpan(
          style: AppTheme.lightTheme.textTheme.displaySmall!.copyWith(
            fontSize: AppSize.size12,
          ),
          children: <TextSpan>[
        TextSpan(
            text: text1,
            recognizer: TapGestureRecognizer()..onTap = () => onTap1,
            style: const TextStyle(
              color: AppColors.codeExpire,
              fontWeight: FontWeight.w400,
            )),
        TextSpan(
            text: text2,
            recognizer: TapGestureRecognizer()..onTap = () => onTap2,
            style: const TextStyle(
              color: AppColors.timer,
              fontWeight: FontWeight.w500,
            )),
      ]));
}
