import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_theme.dart';

Widget phoneInputFields(
    BuildContext context,
    TextEditingController controllername,
  //  VoidCallback Onchanged
    // String hinttext,
    // fillcolor,
    // textcolor,
    // bool readonly,
    // int max_length,
    // {TextInputType? keyboardType,
    // Widget? icon,
    // validator
    // }
    ) {
  return IntlPhoneField(
      cursorColor: Color(0xff545454),
       controller: controllername,
      keyboardType: TextInputType.phone,
      style: AppTheme.lightTheme.textTheme.labelSmall,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      flagsButtonMargin: const EdgeInsets.only(left: 15),
      decoration: InputDecoration(
          // fillColor: Color.fromARGB(255, 237, 235, 235),
          filled: false,
          contentPadding: EdgeInsets.symmetric(
            vertical: 15.h,
            horizontal: 10.h,
          ),
          counter: const Offstage(),
          hintText: 'Phone number',
          hintStyle: AppTheme.lightTheme.textTheme.labelSmall!.copyWith(
            color: AppColors.textFieldHint,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),)),
            // : OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(15.r),
            //         borderSide: const BorderSide(
            //           color: AppColors.errorColor,
            //           width: 1.0,
            //         )),
          dropdownTextStyle:AppTheme.lightTheme.textTheme.labelSmall,
          
      initialCountryCode: 'IN',
      showCountryFlag: false,
       showDropdownIcon: false,
      // dropdownIcon: const Icon(
      //   Icons.keyboard_arrow_down_outlined,
      //   color: Color(0xff545454),
      // ),
      // dropdownIconPosition: IconPosition.trailing,
      // onChanged: (phone) {
      //   setState(() {
      //     errorMsg = false;
      //   });
      //   mobileNum = phone.completeNumber;
      //   print(phone.number);
      // },
    );
}
