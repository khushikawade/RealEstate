import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/custom_fonts/real_state_icons.dart';
import 'package:realstate/helper_widget/Image_widgets.dart';
// import 'package:realstate/helper_widget/Text_widgets.dart';
// import 'package:realstate/helper_widget/progress_indicator.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_size.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/constant.dart';

class AppBarWidget extends StatelessWidget {
  // final String? appBarTitle;
  // final dynamic appBarAdditionalText;
  // final dynamic onclick;

  const AppBarWidget(
      // {this.appBarTitle, this.appBarAdditionalText, this.onclick}
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(alignment: Alignment.center, children: [
        appBarImage(Constants.appBarImage),

        Row(
          children: [
            SizedBox(
              width: 50.h,
            ),

            Expanded(
              child: Center(
                child: Text(Constants.appTitle,
                      style:AppTheme.lightTheme.textTheme.headlineLarge!.copyWith(
                          color: AppColors.white,
                          fontSize: AppSize.size18
                        ),),
              ),
            ),
            SizedBox(
              width: 50.h,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      
                    },
                    child:Icon(RealState.phone_calling_rounded,color: AppColors.white,size: 30.h,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:25.h,top:1.h,),
                    child: Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.red),
                      ),
                  ),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
