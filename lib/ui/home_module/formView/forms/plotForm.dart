import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/custom_fonts/real_state_icons.dart';
import 'package:realstate/helper_widget/Text_widgets.dart';
import 'package:realstate/helper_widget/textFormField.dart';
import 'package:realstate/ui/home_module/formView/formViewModel.dart';
import 'package:realstate/ui/home_module/formView/forms/checkBoxField.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/constant.dart';
import 'package:realstate/utils/validator.dart';

plotForm(BuildContext context, FormViewModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      formLabelWidget(Constants.size, context),
      SizedBox(
        height: 5.h,
      ),
      buildInputFields(
        context,
        model.size,
        Constants.size,
        AppColors.primaryColor,
        AppColors.greyLight,
        false,
        100,
        3,
        keyboardType: TextInputType.text,
        onChange: Validator.fieldNameValidate,
        onTap: () {},
        validator: (val) {
          return Validator.fieldNameValidate(model.size.text);
        },
      ),
      SizedBox(
        height: 10.h,
      ),
      formLabelWidget(Constants.dimension, context),
      SizedBox(
        height: 5.h,
      ),
      Row(
        children: [
          Expanded(
              child: Text(Constants.length,
                  textAlign: TextAlign.left,
                  style: AppTheme.lightTheme.textTheme.labelSmall!
                      .copyWith(color: AppColors.black, fontSize: 10.h))),
          SizedBox(
            width: 30.h,
          ),
          Expanded(
            child: Text(Constants.width,
                  textAlign: TextAlign.left,
                  style: AppTheme.lightTheme.textTheme.labelSmall!
                      .copyWith(color: AppColors.black, fontSize: 10.h))),
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
              Constants.length,
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
              width: 30.h,
              child: Icon(RealState.cross,
                  size: 20.h, color: AppColors.greyLight)),
          Expanded(
            child: buildInputFields(
              context,
              model.secondDimension,
              Constants.width,
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
    ],
  );
}
