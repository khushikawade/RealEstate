import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_size.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      //errorColor: Colors.red,
      //cardTheme: CardTheme(color: kCardColor),
      // floatingActionButtonTheme: FloatingActionButtonThemeData(
      //     backgroundColor: kPrimaryColor, foregroundColor: kOnPrimaryColor),
      // iconTheme: const IconThemeData(
      //   color: Colors.red,
      // ),

      textTheme: TextTheme(
//---------------Label-----------------------//
          labelSmall: TextStyle(
              fontSize: AppSize.size14,
              color: AppColors.textFieldInput,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          labelMedium: TextStyle(
              fontSize: AppSize.size14,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter'),
          labelLarge: TextStyle(
            fontSize: AppSize.size16,
            color: AppColors.lightGrey,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),

//---------------Title-----------------------//
          titleLarge: TextStyle(
              fontSize: AppSize.size27,
              color: AppColors.black,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w900),
          titleMedium: TextStyle(
              fontSize: AppSize.size24,
              color: AppColors.white,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600),
          titleSmall: TextStyle(
              fontSize: AppSize.size24,
              color: AppColors.titleColor,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600),

//---------------subtitle-----------------------//
          displaySmall: TextStyle(
              fontSize: AppSize.size14,
              color: AppColors.subTitleColor.withOpacity(0.90),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400),
          displayMedium: TextStyle(
              fontSize: AppSize.size14,
              color: AppColors.white,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400),
          displayLarge: TextStyle(
              fontSize: AppSize.size16,
              color: AppColors.white,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600),

//---------------HeadLine-----------------------//
          headlineLarge: TextStyle(
              fontSize: AppSize.size33,
              color: AppColors.black,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500),
          bodySmall: TextStyle(
              fontSize: AppSize.size14,
              color: AppColors.black,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600)

          //     titleSmall: TextStyle(
          //         fontSize: TitleSmallTextSize,
          //         color: TitleLargeColor,
          //         fontFamily: FontFamily.almarai,
          //         fontWeight: FontWeight.bold)),
          // appBarTheme: AppBarTheme(
          //     titleTextStyle: TextStyle(
          //       color: appBarTitleColor,
          //       fontSize: 15.sp,
          //       fontWeight: FontWeight.w400,
          //       fontFamily: FontFamily.almarai,
          //     ),
          //     color: Colors.white,
          //     centerTitle: false,
          //     elevation: 0,
          //     iconTheme: IconThemeData(
          //       color: Colors.black,
          //       size: 18.sp,
          //     )),
          // scaffoldBackgroundColor: Colors.white,
          // inputDecorationTheme: InputDecorationTheme(
          //   labelStyle: TextStyle(color: kTxtFieldColor),
          //   contentPadding:
          //       new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          //   hintStyle: TextStyle(
          //       color: kTxtFieldColor,
          //       height: 1.2,
          //       fontSize: Globals.deviceType == 'phone'
          //           ? kSubtitleFontSize
          //           : kSubtitleFontSize + kSize),
          //   focusedBorder: OutlineInputBorder(
          //       borderSide:
          //           BorderSide(width: kBorderWidth, color: kTxtfieldBorderColor),
          //       borderRadius: BorderRadius.circular(kBorderRadius)),
          //   enabledBorder: OutlineInputBorder(
          //       borderSide:
          //           BorderSide(width: kBorderWidth, color: kTxtfieldBorderColor),
          //       borderRadius: BorderRadius.circular(kBorderRadius)),
          // ),
          // radioTheme: RadioThemeData(
          //     overlayColor: MaterialStateProperty.all<Color>(kSecondaryColor),
          //     fillColor: MaterialStateProperty.all<Color>(kBackgroundColor)),
          // bottomNavigationBarTheme: BottomNavigationBarThemeData(
          //   backgroundColor: Colors.white,
          //   elevation: 10,
          //   selectedLabelStyle: TextStyle(
          //       color: Color(0xFF4a5aa6),
          //       fontFamily: 'Roboto Regular',
          //       fontSize: Globals.deviceType == 'phone'
          //           ? kSubtitle2FontSize
          //           : kSubtitle2FontSize + kSize),
          //   selectedIconTheme: IconThemeData(
          //     color: Color(0xFF4a5aa6),
          //   ),
          //   unselectedIconTheme: IconThemeData(
          //     color: Color(0xff89A7D7),
          //   ),
          //   unselectedLabelStyle: TextStyle(
          //       color: Color(0xff89A7D7),
          //       fontFamily: 'Roboto Regular',
          //       fontSize: Globals.deviceType == 'phone'
          //           ? kSubtitle2FontSize
          //           : kSubtitle2FontSize + kSize),
          //   selectedItemColor: Color(0xff4a5aa6),
          //   unselectedItemColor: Color(0xff89A7D7),
          //   showUnselectedLabels: true,
          // ),
          //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor)
          ));
  

  ThemeData? _themeData;

  ThemeData? getTheme() => _themeData;
}

class SizeTheme {
  static const List<double> spacing = [
    0.0, //0
    2.0, //1
    4.0, //2
    6.0, //3
    8.0, //4
    10.0, //5
    12.0, //6
    14.0, //7
    16.0, //8
    18.0, //9
    20.0, //10
    22.0, //11
    24.0, //12
    26.0, //13
    28.0, //14
    30.0, //15
    32.0, //16
    34.0, //17
    36.0, //18
    38.0, //19
    40.0, //20
    42.0, //21
    44.0, //22
    46.0, //23
    48.0, //24
    50.0, //25
    52.0, //26
  ];
}

class IconSizeTheme {
  static const List<double> size = [
    0.0, //0
    2.0, //1
    4.0, //2
    6.0, //3
    8.0, //4
    10.0, //5
    12.0, //6
    16.0, //7
    20.0, //8
    24.0, //9
    28.0, //10
    32.0, //11
    36.0, //12
    40.0, //13
    44.0, //14
    48.0, //15
    52.0, //16
    85.0 //17
  ];
}
