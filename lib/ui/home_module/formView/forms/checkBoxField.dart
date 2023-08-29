import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/helper_widget/Text_widgets.dart';
import 'package:realstate/ui/home_module/formView/formViewModel.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/constant.dart';

Widget facing(
  BuildContext context,
  FormViewModel model,
) {
  return Column(
     
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Expanded(
            child: InkWell(
                onTap: () {
                  model.checkBoxTapped(1);
                },
                child: checkBoxField(
                    context,
                    model,
                    model.checkedIndex == 1
                        ? AppColors.primaryColor
                        : AppColors.white,
                    1,
                    Constants.north)),
          ),
          Expanded(
            child: InkWell(
                onTap: () {
                  model.checkBoxTapped(2);
                },
                child: checkBoxField(
                    context,
                    model,
                    model.checkedIndex == 2
                        ? AppColors.primaryColor
                        : AppColors.white,
                    2,
                    Constants.east)),
          ),
          Expanded(
            child: InkWell(
                onTap: () {
                  model.checkBoxTapped(3);
                },
                child: checkBoxField(
                    context,
                    model,
                    model.checkedIndex == 3
                        ? AppColors.primaryColor
                        : AppColors.white,
                    3,
                    Constants.south)),
          ),
          Expanded(
            child: InkWell(
                onTap: () {
                  model.checkBoxTapped(4);
                },
                child: checkBoxField(
                    context,
                    model,
                    model.checkedIndex == 4
                        ? AppColors.primaryColor
                        : AppColors.white,
                    4,
                    Constants.west)),
          ),
        ],
      ),
      model.checkedIndex == 5
          ? SizedBox(
              height: 10.h,
            )
          : Container(),
      model.checkedIndex == 5
          ? errorTextWidget(Constants.pleaseSelectFacing, context)
          : Container(),
    ],
  );
}

Widget checkBoxField(BuildContext context, FormViewModel model, Color color,
    int checked, String facing) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 20.w,
        height: 20.h,
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(width: 1.w, color: AppColors.lightGrey)),
      ),
      SizedBox(
        height: 5.h,
      ),
      Text(facing,
          textAlign: TextAlign.left,
          style: AppTheme.lightTheme.textTheme.labelSmall!
              .copyWith(color: AppColors.black, fontSize: 10.h)),
    ],
  );
}
