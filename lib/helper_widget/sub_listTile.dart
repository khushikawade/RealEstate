import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/constant.dart';

Widget subListtile(model, String heading) {
  return Container(
      padding:
          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.h, right: 10.h),
      decoration: BoxDecoration(
        border:
            Border.all(width: 1.h, color: AppColors.greyLight),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          sub_list_tile_helper(
              Constants.plot,
              model.plot == true
                  ? Icon(Icons.ac_unit, size: 14.h, color: AppColors.timer)
                  : Icon(Icons.ac_unit, size: 14.h, color: AppColors.homeIcon),
              model,
              1),
          Divider(
            color: AppColors.greyLight,
            height: 5.h,
            thickness: 1.h,
            indent: 10.h,
            endIndent: 10.h,
          ),
          model.plot == true
              ? plotListTile(model, heading, Constants.plot)
              : Container(),
          sub_list_tile_helper(
              Constants.land,
              model.land == true
                  ? Icon(Icons.ac_unit, size: 14.h, color: AppColors.timer)
                  : Icon(Icons.ac_unit, size: 14.h, color: AppColors.homeIcon),
              model,
              2),
          Divider(
            color: AppColors.greyLight.withOpacity(.9),
            height: 5.h,
            thickness: 1.h,
            indent: 10.h,
            endIndent: 10.h,
          ),
          model.land == true
              ? commercialConstructedListTile(model, heading, Constants.land)
              : Container(),
          sub_list_tile_helper(
              Constants.commercialConstructed,
              model.commercialConstructed == true
                  ? Icon(Icons.ac_unit, size: 14.h, color: AppColors.timer)
                  : Icon(Icons.ac_unit, size: 14.h, color: AppColors.homeIcon),
              model,
              3),
          Divider(
            color: AppColors.greyLight.withOpacity(.9),
            height: 5.h,
            thickness: 1.h,
            indent: 10.h,
            endIndent: 10.h,
          ),
          model.commercialConstructed == true
              ? landListTile(model, heading, Constants.commercialConstructed)
              : Container(),
          sub_list_tile_helper(
              Constants.residentialConstructed,
              model.residentialConstructed == true
                  ? Icon(Icons.ac_unit, size: 14.h, color: AppColors.timer)
                  : Icon(Icons.ac_unit, size: 14.h, color: AppColors.homeIcon),
              model,
              4),
          model.residentialConstructed == true
              ? residentialConstructedListTile(model, heading, Constants.residentialConstructed)
              : Container(),
        ],
      ));
}

Widget sub_list_tile_helper(String title, Widget? icon, model, int index) {
  return InkWell(
    child: Padding(
      padding:
          EdgeInsets.only(left: 10.h, right: 10.h, top: 10.h, bottom: 10.h),
      child: Row(
        children: [
          Container(
            width: 5.w,
            height: 5.w,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColors.black),
          ),
          SizedBox(
            width: 10.h,
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: AppTheme.lightTheme.textTheme.bodySmall!.copyWith(
                fontSize: 13.h,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          icon!
        ],
      ),
    ),
    onTap: () {
      switch (index) {
        case 1:
          if (model.plot == false) {
            model.plot = true;
            model.land = false;
            model.commercialConstructed = false;
            model.residentialConstructed = false;
          } else {
            model.plot = false;
          }

        case 2:
          if (model.land == false) {
            model.plot = false;
            model.land = true;
            model.commercialConstructed = false;
            model.residentialConstructed = false;
          } else {
            model.land = false;
          }
        case 3:
          if (model.commercialConstructed == false) {
            model.plot = false;
            model.land = false;
            model.commercialConstructed = true;
            model.residentialConstructed = false;
          } else {
            model.commercialConstructed = false;
          }

        case 4:
          if (model.residentialConstructed == false) {
            model.plot = false;
            model.land = false;
            model.commercialConstructed = false;
            model.residentialConstructed = true;
          } else {
            model.residentialConstructed = false;
          }
        default:
          model.plot = true;
          model.land = false;
          model.commercialConstructed = false;
          model.residentialConstructed = false;
      }
    },
  );
}

Widget plotListTile(model, String heading, String subheading) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        finalListTileItem(model, heading, subheading, Constants.residential),
        finalListTileItem(model, heading, subheading, Constants.commercial),
        
      ],
    ),
  );
}
Widget landListTile(model, String heading, String subheading) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            finalListTileItem(model, heading, subheading, Constants.residential),
            finalListTileItem(model, heading, subheading, Constants.commercial),
            
          ],
        ),
        SizedBox(
           height: 8.h,
        ),
        Row(
          children: [
            finalListTileItem(model, heading, subheading, Constants.industrial),
            finalListTileItem(model, heading, subheading, Constants.green),
            
          ],
          ),
          SizedBox(
           height: 8.h,
        ),
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
          children: [
            finalListTileItem(model, heading, subheading, Constants.agriculture),
            
          ],
          ),
          SizedBox(
           height: 8.h,
        ),
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
          children: [
            finalListTileItem(model, heading, subheading, Constants.nonAgriculture), 
          ],
          ),
          
      ],
    ),
  );
}
Widget commercialConstructedListTile(model, String heading, String subheading) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          children: [
            finalListTileItem(model, heading, subheading, Constants.office),
            finalListTileItem(model, heading, subheading, Constants.showroom),
            
          ],
        ),
       SizedBox(
           height: 8.h,
        ),
        Row(
          children: [
            finalListTileItem(model, heading, subheading, Constants.warehouse),
            finalListTileItem(model, heading, subheading, Constants.restaurant),
            
          ],
        ),
        SizedBox(
           height: 8.h,
        ),
        Row(
          children: [
            finalListTileItem(model, heading, subheading, Constants.independentBuilding), 
          ],
        ),
        SizedBox(
           height: 8.h,
        ),
         Row(
          children: [
            finalListTileItem(model, heading, subheading, Constants.industrialPlant), 
          ],
          ),
      ],
    ),
  );
}
Widget residentialConstructedListTile(model, String heading, String subheading) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          children: [
            finalListTileItem(model, heading, subheading, Constants.bungalow),
            finalListTileItem(model, heading, subheading, Constants.rowHouse),
            
          ],
        ),
        SizedBox(
           height: 8.h,
        ),
         Row(
          children: [
            finalListTileItem(model, heading, subheading, Constants.apartment), 
          ],
        ),
      ],
    ),
  );
}

 Widget finalListTileItem(
    model, String heading, String subheading, String title) {
  return Expanded(
      child: InkWell(
    onTap: () {
      model.finalListTileItemontap(heading, subheading, title);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 10.h,
        ),
        Container(
          width: 5.w,
          height: 5.w,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: AppColors.black),
        ),
        SizedBox(
          width: 10.h,
        ),
        Text(
          title,
          textAlign: TextAlign.left,
          style: AppTheme.lightTheme.textTheme.bodySmall!.copyWith(
            fontSize: 13.h,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  ));
}
