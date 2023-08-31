import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/constant.dart';

Widget Main_list_tile(String title, IconData icon, model, int index) {
  return Container(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      decoration: BoxDecoration(
        border:
            Border.all(width: 1.h, color: AppColors.greyLight.withOpacity(.9)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
            height: 53.h,
            width: 53.h,
            decoration: BoxDecoration(
              color: AppColors.timer.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(10.h),
            child: Icon(icon, size: 20.h, color: AppColors.timer)),
        title: Text(
          title,
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          switch (index) {
            case 1:
              if (model.buyProperty == false) {
                model.buyProperty = true;
                model.saleProperty = false;
                model.giveOnRent = false;
                model.takeOnRent = false;
                model.support = false;
                model.previousPost = false;
              } else {
                model.buyProperty = false;
              }

            case 2:
              if (model.saleProperty == false) {
                model.buyProperty = false;
                model.saleProperty = true;
                model.giveOnRent = false;
                model.takeOnRent = false;
                model.support = false;
                model.previousPost = false;
              } else {
                model.saleProperty = false;
              }
            case 3:
              if (model.giveOnRent == false) {
                model.buyProperty = false;
                model.saleProperty = false;
                model.giveOnRent = true;
                model.takeOnRent = false;
                model.support = false;
                model.previousPost = false;
              } else {
                model.giveOnRent = false;
              }

            case 4:
              if (model.takeOnRent == false) {
                model.buyProperty = false;
                model.saleProperty = false;
                model.giveOnRent = false;
                model.takeOnRent = true;
                model.support = false;
                model.previousPost = false;
              } else {
                model.takeOnRent = false;
              }

            case 5:
              if (model.support == false) {
                model.buyProperty = false;
                model.saleProperty = false;
                model.giveOnRent = false;
                model.takeOnRent = false;
                model.support = true;
                model.previousPost = false;
              } else {
                model.support = false;
              }

            case 6:
              if (model.previousPost == false) {
                model.buyProperty = false;
                model.saleProperty = false;
                model.giveOnRent = false;
                model.takeOnRent = false;
                model.support = false;
                model.previousPostOntap();
              } 

            default:
              model.buyProperty = false;
              model.saleProperty = false;
              model.giveOnRent = false;
              model.takeOnRent = false;
              model.support = false;
              model.previousPost = false;
          }
        },
      ));
}
