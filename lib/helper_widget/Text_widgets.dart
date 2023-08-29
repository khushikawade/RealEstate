import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_size.dart';
import 'package:realstate/utils/app_theme.dart';



Widget headlineTextWidget(text, context) {
  return Text(text, style: AppTheme.lightTheme.textTheme.headlineLarge);
}
Widget onboardingHeadingWidget(text, context) {
  return Text(text,textAlign: TextAlign.start, style: AppTheme.lightTheme.textTheme.titleMedium);
}
Widget onboardingSubtitleWidget(text, context) {
  return Text(text,textAlign: TextAlign.start, style: AppTheme.lightTheme.textTheme.displayMedium);
}
Widget onboardingLabelWidget(text, context){
 return Text(text, style: AppTheme.lightTheme.textTheme.displayLarge); 
}
Widget formLabelWidget(text, context){
 return Text(text,textAlign: TextAlign.left, style: AppTheme.lightTheme.textTheme.labelSmall!.copyWith(color: AppColors.black)); 
}
Widget formLabelRichText(text1,text2, context){

return RichText(
      text: TextSpan(
          style: AppTheme.lightTheme.textTheme.labelSmall,
          children: <TextSpan>[
        TextSpan(
            text: text1,
            style:  TextStyle(
              color: AppColors.black,
              fontSize: 16.h, 
            )),
        TextSpan(
            text: text2,
            style:  TextStyle(
              color: AppColors.textFieldHint,
              fontSize: 16.h, 
            )),
      ]));
}
Widget buttonTextWidget(text, context){
 return Text(text, style: AppTheme.lightTheme.textTheme.labelMedium); 
}
Widget headingTextWidget(text, context){
 return Text(text,textAlign: TextAlign.center, style: AppTheme.lightTheme.textTheme.titleSmall); 
}
Widget subheadingTextWidget(text, context){
 return Text(text, style: AppTheme.lightTheme.textTheme.displaySmall); 
}
Widget errorTextWidget(text, context){
 return Text(text,textAlign: TextAlign.start, style: AppTheme.lightTheme.textTheme.bodyMedium!.copyWith(color: AppColors.errorColor)); 
}

Widget subeadingTextWidget(text, context) {
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