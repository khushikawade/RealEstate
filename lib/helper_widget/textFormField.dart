import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/custom_fonts/real_state_icons.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_theme.dart';

Widget buildInputFields(
    BuildContext context,
    TextEditingController controllername,
    String hinttext,
    fillcolor,
    textcolor,
    bool readonly,
    int max_length,
    {TextInputType? keyboardType,
    onTap,
    Widget? icon,
    validator}) {
  return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [LengthLimitingTextInputFormatter(max_length)],
      cursorColor: Theme.of(context).primaryColor,
      validator: validator,
      controller: controllername,
      readOnly: readonly,
      
      //enabled: false,
      keyboardType: keyboardType ?? TextInputType.text,
      style: AppTheme.lightTheme.textTheme.labelSmall,
      onTap: onTap,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              top: 16.sp, bottom: 16.sp, left: 24.sp, right: 24.sp),
          // filled: true,
          fillColor: fillcolor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: fillcolor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: fillcolor,
                width: 1.0,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(
                color: AppColors.errorColor,
                width: 1.0,
              )),
          errorStyle: TextStyle(
            color: AppColors.errorColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
          hintText: hinttext,
          hintStyle: AppTheme.lightTheme.textTheme.labelSmall!.copyWith(
            color: AppColors.textFieldHint,
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(
                color: AppColors.errorColor,
                width: 1.0,
              )),
          prefixIcon: icon != null
              ? Padding(
                  padding: EdgeInsets.only(left: 26.sp, right: 10.sp),
                  child: icon)
              : null,
          suffixIcon: icon != null
              ? Padding(
                  padding: EdgeInsets.only(right: 26.sp),
                  child: Icon(
                    RealState.done,
                    color: validator == null
                        ? AppColors.textFieldHint
                        : AppColors.primaryColor,
                  ))
              : null));
}
