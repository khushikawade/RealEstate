import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/custom_fonts/real_state_icons.dart';
import 'package:realstate/helper_widget/Image_widgets.dart';
import 'package:realstate/helper_widget/Text_widgets.dart';
import 'package:realstate/helper_widget/button_widgets.dart';
import 'package:realstate/helper_widget/textFormField.dart';
import 'package:realstate/ui/user_module/Registration_module/registration_model.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/constant.dart';
import 'package:realstate/utils/validator.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final otpVerifyModel =
          Provider.of<registrationModel>(context, listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<registrationModel>(context);
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      SizedBox(
        height: 60.h,
      ),
      headingTextWidget(Constants.registrationHeading, context),
      SizedBox(
        height: 20.h,
      ),
      subheadingTextWidget(Constants.registrationSubheading, context),
      SizedBox(
        height: 20.h,
      ),
      headingImage(Constants.verifyImage),
      SizedBox(
        height: 20.h,
      ),
      RegistrationForm(model)
    ])));
  }

  RegistrationForm(registrationModel model) {
    return Form(
       autovalidateMode: AutovalidateMode.onUserInteraction,
        key: model.globalKey,
        child: Padding(
            padding: EdgeInsets.fromLTRB(16.sp, 16.sp, 16.sp, 0),
            child: Column(
              children: [
                buildInputFields(
              context,
              model.nameField,
              Constants.nameFieldHint,
              AppColors.primaryColor,
              AppColors.black,
              false,
              100,
              keyboardType: TextInputType.text,
              icon: Icon(
                RealState.user_rounded,
               size: 14.h,
              ),
              validator: (val) {
                return Validator.nameValidate(model.nameField);
              },),
               
                SizedBox(
                  height: 15.h,
                ),

                ButtonWidget(
                    bordercolor: AppColors.buttonColor,
                    isLoading: model.showLoader,
                    textcolor: AppColors.white,
                    title: Constants.verifyButton,
                    backgroundcolorname: AppColors.buttonColor,
                    callBack: () {
                      model.registrationButtonPressed();
                    }),
                    SizedBox(
                  height: 15.h,
                ),
                
              ],
            )));
  }
}
