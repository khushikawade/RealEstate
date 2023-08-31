import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/custom_fonts/real_state_icons.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/constant.dart';

import '../ui/previous_post_module/PreviousPostScreen/previous_post_model.dart';

class PriviousPostAppBar extends StatelessWidget {
  final String? appBarTitle;
  bool shortBy;
  // final dynamic appBarAdditionalText;
  // final dynamic onclick;

  PriviousPostAppBar(
    this.appBarTitle,
    this.shortBy,
    
  );
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PreviousPostModel>(context);
    return Padding(
        padding: EdgeInsets.fromLTRB(15.h, 10.h, 15.h, 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(RealState.keyboard_arrow_left,
                      size: 15.h, color: AppColors.homeIcon),
                ),
                Expanded(
                  child: Text(appBarTitle!,
                      textAlign: TextAlign.center,
                      style: AppTheme.lightTheme.textTheme.titleSmall!
                          .copyWith(fontSize: 18.h)),
                ),
                shortBy == true
                    ? Icon(RealState.filter,
                        size: 15.h, color: AppColors.buttonColor)
                    : SizedBox(
                        width: 20.h,
                      ),
              ],
            ),
            SizedBox(height: 10.h),
            shortBy == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            model.sortbyOntap();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(Constants.sortBy,
                                  textAlign: TextAlign.center,
                                  style: AppTheme
                                      .lightTheme.textTheme.displayLarge!
                                      .copyWith(
                                    fontSize: 10.h,
                                    color: AppColors.buttonColor,
                                  )),
                              SizedBox(
                                width: 5.w,
                              ),
                              Icon(
                                RealState.down_open,
                                size: 8.h,
                                color: AppColors.buttonColor,
                              ),
                            ],
                          )),
                    ],
                  )
                : Container(),
          ],
        ));
  }
}
