import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/custom_fonts/real_state_icons.dart';
import 'package:realstate/ui/home_module/formView/formViewModel.dart';
import 'package:realstate/ui/home_module/formView/forms/commercialConstructedForm.dart';
import 'package:realstate/ui/home_module/formView/forms/commonFormField.dart';
import 'package:realstate/ui/home_module/formView/forms/landForm.dart';
import 'package:realstate/ui/home_module/formView/forms/plotForm.dart';
import 'package:realstate/ui/home_module/formView/forms/residentialConstructedForm.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/constant.dart';



class FormView {
  static showFormbox(BuildContext context, heading, subHeading, title) {
    final model = Provider.of<FormViewModel>(context, listen: false);
    model.heading = heading;
    model.subHeading = subHeading;
    model.title = title;

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: FormViewContent(),
          );
        }).then((result) {
      if (result == true) {
        model.onSuccessRedirect();
      }
    });
  }
}

class FormViewContent extends StatelessWidget {
  const FormViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FormViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRect(
        child: Container(
          margin: EdgeInsets.all(15.h),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: AppColors.white),
          child: Padding(
            padding: EdgeInsets.all(10.h),
            child: Stack(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        model.closePopuponcross();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(RealState.cross,
                              size: 20.h, color: AppColors.homeIcon)
                        ],
                      ),
                    ),
                    Text(
                      model.subHeading,
                      textAlign: TextAlign.center,
                      style: AppTheme.lightTheme.textTheme.bodySmall!.copyWith(
                        fontSize: 15.h,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Divider(
                      color: AppColors.greyLight,
                      height: 5.h,
                      thickness: 1.h,
                      indent: 10.h,
                      endIndent: 10.h,
                    ),
                  ],
                ),
                Padding(
                    padding:
                        EdgeInsets.only(top: 70.h, left: 10.h, right: 10.h),
                    child: Form(
                      key: model.formViewGlobalKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commanformfield(context, model),
                            SizedBox(
                              height: 10.h,
                            ),
                            model.subHeading == Constants.plot
                                ? plotForm(context, model)
                                : model.subHeading == Constants.land
                                    ? landForm(context, model)
                                    : model.subHeading ==
                                            Constants.commercialConstructed
                                        ? commercialConstructedForm(
                                            context, model)
                                        : residentialConstructedForm(
                                            context, model),
                            SizedBox(
                              height: 10.h,
                            ),
                            commanformFieldEnd(context, model),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
