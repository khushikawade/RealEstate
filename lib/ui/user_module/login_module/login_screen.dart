import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/helper_widget/Image_widgets.dart';
import 'package:realstate/helper_widget/button_widgets.dart';
import 'package:realstate/helper_widget/phone_text_field.dart';
import 'package:realstate/helper_widget/text_widgets.dart';
import 'package:realstate/ui/user_module/login_module/login_view_model.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_util.dart';
import 'package:realstate/utils/constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(context: AppUtil.getContext()),
      child: Consumer<LoginViewModel>(builder: (context, model, child) {
        return Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
          SizedBox(
            height: 60.h,
          ),
          headingTextWidget(Constants.loginHeading, context),
          SizedBox(
            height: 20.h,
          ),
          subheadingTextWidget(Constants.loginSubheading, context),
          SizedBox(
            height: 20.h,
          ),
          headingImage(Constants.loginImage),
          SizedBox(
            height: 20.h,
          ),
          loginForm(model),
        ])));
      }),
    );
  }

  Widget loginForm(LoginViewModel model) {
    return Form(
            key: model.loginGlobalKey,
            child: Padding(
                padding: EdgeInsets.fromLTRB(16.sp, 16.sp, 16.sp, 0),
                child: Column(
                  children: [
                    phoneInputFields(context, model.mobileNoControllers 
                    
                    ),
                    SizedBox(
                    height: 15.h,
                  ),
                    ButtonWidget(
                        bordercolor: AppColors.buttonColor,
                        isLoading: model.showLoader,
                        textcolor: AppColors.white,
                        title: Constants.loginButton,
                        backgroundcolorname: AppColors.buttonColor,
                        callBack: () {
                          model.loginButtonPressed();
                        }),
                  ],
                )));
  }
}
