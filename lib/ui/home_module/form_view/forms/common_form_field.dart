import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/helper_widget/button_widgets.dart';
import 'package:realstate/helper_widget/text_widgets.dart';
import 'package:realstate/helper_widget/text_form_field.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/constant.dart';
import 'package:realstate/utils/validator.dart';

commanformfield(BuildContext context, model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            child: formLabelWidget(Constants.state, context),
          ),
          SizedBox(
            width: 10.h,
          ),
          Expanded(
            child: formLabelWidget(Constants.city, context),
          )
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
              model.state,
              Constants.state,
              AppColors.primaryColor,
              AppColors.greyLight,
              false,
              100,
              3,
              keyboardType: TextInputType.text,
              onChange: Validator.fieldNameValidate,
              onTap: () {},
              validator: (val) {
                return Validator.fieldNameValidate(model.state.text);
              },
            ),
          ),
          SizedBox(
            width: 10.h,
          ),
          Expanded(
            child: buildInputFields(
              context,
              model.city,
              Constants.city,
              AppColors.primaryColor,
              AppColors.greyLight,
              false,
              100,
              3,
              keyboardType: TextInputType.text,
              onChange: Validator.fieldNameValidate,
              onTap: () {},
              validator: (val) {
                return Validator.fieldNameValidate(model.city.text);
              },
            ),
          )
        ],
      ),
      SizedBox(
        height: 10.h,
      ),
      formLabelWidget(Constants.locality, context),
      SizedBox(
        height: 5.h,
      ),
      buildInputFields(
        context,
        model.locality,
        Constants.locality,
        AppColors.primaryColor,
        AppColors.greyLight,
        false,
        100,
        3,
        keyboardType: TextInputType.text,
        onChange: Validator.fieldNameValidate,
        onTap: () {},
        validator: (val) {
          return Validator.fieldNameValidate(model.locality.text);
        },
      ),
    ],
  );
}

commanformFieldEnd(BuildContext context, model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, 
    children: [
      formLabelWidget(Constants.features, context),
      SizedBox(
        height: 5.h,
      ),
      buildInputFields(
        context,
        model.features,
        Constants.features,
        AppColors.primaryColor,
        AppColors.greyLight,
        false,
        100,
        3,
        keyboardType: TextInputType.text,
        onChange: Validator.fieldNameValidate,
        onTap: () {},
        validator: (val) {
          return Validator.fieldNameValidate(model.features.text);
        },
      ),
      SizedBox(
        height: 10.h,
      ),
      formLabelWidget(Constants.comment, context),
      SizedBox(
        height: 5.h,
      ),
      buildInputFields(
        context,
        model.comment,
        Constants.comment,
        AppColors.primaryColor,
        AppColors.greyLight,
        false,
        100,
        3,
        keyboardType: TextInputType.text,
        onChange: Validator.fieldNameValidate,
        onTap: () {},
        validator: (val) {
          return Validator.fieldNameValidate(model.comment.text);
        },
      ),
      SizedBox(
        height: 20.h,
      ),
      ButtonWidget(
          bordercolor: AppColors.buttonColor,
          isLoading: model.showLoader,
          textcolor: AppColors.white,
          title: Constants.formButton,
          backgroundcolorname: AppColors.buttonColor,
          callBack: () {
            model.formButtonPressed();
          }),
    ],
  );
}
