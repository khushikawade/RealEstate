import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_size.dart';
import 'package:realstate/utils/app_theme.dart';


Widget headingTextWidget(text, context) {
  return Text(text, style: AppTheme.lightTheme.textTheme.titleMedium);
}
Widget headlineTextWidget(text, context) {
  return Text(text, style: AppTheme.lightTheme.textTheme.headlineLarge);
}
Widget OnboardingHeadingWidget(text, context) {
  return Text(text,textAlign: TextAlign.start, style: AppTheme.lightTheme.textTheme.titleMedium);
}
Widget OnboardingSubtitleWidget(text, context) {
  return Text(text,textAlign: TextAlign.start, style: AppTheme.lightTheme.textTheme.displayMedium);
}
Widget subheadingTextWidget(text, context) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        color: AppColors.black,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize:AppSize.size28),
  );
}