import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/helper_widget/text_widgets.dart';
import 'package:realstate/helper_widget/text_form_field.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/constant.dart';
import 'package:realstate/utils/validator.dart';


 landForm(BuildContext context,model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       formLabelRichText(Constants.size,Constants.acre, context),
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
      formLabelRichText(Constants.front,Constants.ft, context),
      SizedBox(
        height: 5.h,
      ),
      buildInputFields(
        context,
        model.front,
        Constants.front,
        AppColors.primaryColor,
        AppColors.greyLight,
        false,
        100,
        3,
        keyboardType: TextInputType.text,
        onChange: Validator.fieldNameValidate,
        onTap: () {},
        validator: (val) {
          return Validator.fieldNameValidate(model.front.text);
        },
      ),
        
      ],
      
    );
  }