import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/utils/app_colors.dart';

Widget buildInputFields(
    BuildContext context,
    TextEditingController controllername,
    String hinttext,
    fillcolor,
    textcolor,
    bool readonly,
    int max_length,
    {TextInputType? keyboardType,
    Widget? icon,
    validator}) {
  return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [LengthLimitingTextInputFormatter(max_length)],
      cursorColor: Theme.of(context).primaryColor,
      validator: validator ?? null,
      controller: controllername,
      readOnly: readonly,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              top: 16.sp, bottom: 16.sp, left: 24.sp, right: 24.sp),
          // filled: true,
           fillColor: fillcolor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(66.r)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
              // color: fillcolor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(66.r),
              borderSide: const BorderSide(
                color: AppColors.black,
                width: 1.0,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(66.r),
              borderSide: const BorderSide(
                color: AppColors.red,
                width: 1.0,
              )),
          errorStyle: TextStyle(
            color: AppColors.red,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
          hintText: hinttext,
          hintStyle: TextStyle(
            color: AppColors.lightGrey,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(66.r),
              borderSide: const BorderSide(
                color: AppColors.red,
                width: 1.0,
              )),
          suffixIcon: icon != null
              ? Padding(padding: EdgeInsets.only(right: 26.sp), child: icon)
              : null));
}
