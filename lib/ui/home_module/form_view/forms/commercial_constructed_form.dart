import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/helper_widget/text_form_field.dart';
import 'package:realstate/helper_widget/text_widgets.dart';
import 'package:realstate/ui/home_module/form_view/forms/check_box_field.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/constant.dart';
import 'package:realstate/utils/validator.dart';


 commercialConstructedForm(BuildContext context,model) {
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       formLabelRichText(Constants.carpetArea,Constants.sqFt, context),
      SizedBox(
        height: 5.h,
      ),
      buildInputFields(
        context,
        model.carpetArea,
        Constants.carpetArea,
        AppColors.primaryColor,
        AppColors.greyLight,
        false,
        100,
        3,
        keyboardType: TextInputType.text,
        onChange: Validator.fieldNameValidate,
        onTap: () {},
        validator: (val) {
          return Validator.fieldNameValidate(model.carpetArea.text);
        },
      ),
       SizedBox(
        height: 10.h,
      ),
      Row(
        children: [
          Expanded(
              child: Text(Constants.floor,
                  textAlign: TextAlign.left,
                  style: AppTheme.lightTheme.textTheme.labelSmall!
                      .copyWith(color: AppColors.black, fontSize: 12.h))),
          SizedBox(
            width: 10.h,
          ),
          Expanded(
            child: Text(Constants.hight,
                  textAlign: TextAlign.left,
                  style: AppTheme.lightTheme.textTheme.labelSmall!
                      .copyWith(color: AppColors.black, fontSize: 12.h))),
        ],
      ),
      SizedBox(
        height: 5.h,
      ),
      Row(
        children: [
          Expanded(
            child: buildInputFields(
              context,
              model.firstDimension,
              Constants.floor,
              AppColors.primaryColor,
              AppColors.greyLight,
              false,
              100,
              3,
              keyboardType: TextInputType.text,
              onChange: Validator.fieldNameValidate,
              onTap: () {},
              validator: (val) {
                return Validator.fieldNameValidate(model.firstDimension.text);
              },
            ),
          ),
          SizedBox(
              width: 10.h,
              ),
          Expanded(
            child: buildInputFields(
              context,
              model.secondDimension,
              Constants.hight,
              AppColors.primaryColor,
              AppColors.greyLight,
              false,
              100,
              3,
              keyboardType: TextInputType.text,
              onChange: Validator.fieldNameValidate,
              onTap: () {},
              validator: (val) {
                return Validator.fieldNameValidate(model.secondDimension.text);
              },
            ),
          )
        ],
      ),
      SizedBox(
        height: 10.h,
      ),
      formLabelWidget(Constants.facing, context),
      SizedBox(
        height: 5.h,
      ),
      facing(context, model),
      SizedBox(
        height: 10.h,
      ),
      formLabelWidget(Constants.plotArea, context),
      SizedBox(
        height: 5.h,
      ),
      buildInputFields(
        context,
        model.plotArea,
        Constants.plotArea,
        AppColors.primaryColor,
        AppColors.greyLight,
        false,
        100,
        3,
        keyboardType: TextInputType.text,
        onChange: Validator.fieldNameValidate,
        onTap: () {},
        validator: (val) {
          return Validator.fieldNameValidate(model.plotArea.text);
        },
      ),
        
      ],
      
    );
  }