import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/custom_fonts/real_state_icons.dart';
import 'package:realstate/helper_widget/button_widgets.dart';
import 'package:realstate/helper_widget/image_picker.dart';
import 'package:realstate/helper_widget/text_widgets.dart';
import 'package:realstate/helper_widget/text_form_field.dart';
import 'package:realstate/services/models/user_model.dart';
import 'package:realstate/ui/user_module/registration_module/registration_model.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_size.dart';
import 'package:realstate/utils/app_theme.dart';
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
      final User? message = ModalRoute.of(context)?.settings.arguments as User?;
      print(message!.mobile);
      print(message.otp);
      if (message != null) {
        otpVerifyModel.mobile = message.mobile;
      }
     
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
      // ImagePickerWidget(),
      headingTextWidget(Constants.registrationHeading, context),
      SizedBox(
        height: 20.h,
      ),
      subheadingTextWidget(Constants.registrationSubheading, context),
      SizedBox(
        height: 20.h,
      ),
      ImagePickerWidget(),

      SizedBox(
        height: 20.h,
      ),
      RegistrationForm(model)
    ])));
  }

  RegistrationForm(registrationModel model) {
    return Form(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        key: model.registrationglobalKey,
        child: Padding(
            padding: EdgeInsets.fromLTRB(16.sp, 16.sp, 16.sp, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formLabelWidget(Constants.nameFieldLabel, context),
                SizedBox(
                  height: 10.h,
                ),
                buildInputFields(
                  context,
                  model.nameController,
                  Constants.nameFieldHint,
                  AppColors.primaryColor,
                  AppColors.primaryColor,
                  false,
                  100,
                  1,
                  keyboardType: TextInputType.text,
                  onChange: Validator.fieldNameValidate,
                  onTap: () {},
                 icon: Icon(
                    RealState.user_rounded,
                    color: AppColors.primaryColor,
                    size: 14.h,
                  ),

                  validator: (val) {
                    return Validator.fieldNameValidate(
                        model.nameController.text);
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                formLabelWidget(Constants.emailFieldLabel, context),
                SizedBox(
                  height: 10.h,
                ),
                buildInputFields(
                  context,
                  model.emailField,
                  Constants.emailFieldHint,
                  AppColors.primaryColor,
                  AppColors.primaryColor,
                  false,
                  100,
                  1,
                  keyboardType: TextInputType.text,
                  onChange: Validator.emailValidateNew,
                  onTap: () {},
                  icon: Icon(
                    RealState.letter_unread,
                    color: AppColors.primaryColor,
                    size: 14.h,
                  ),
                  validator: (val) {
                    return Validator.emailValidateNew(model.emailField.text);
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                formLabelWidget(Constants.dateFieldLabel, context),
                SizedBox(
                  height: 10.h,
                ),
                buildInputFields(
                  context,
                  model.dateField,
                  Constants.dateFieldHint,
                  AppColors.primaryColor,
                 AppColors.primaryColor,
                  true,
                  100,
                  1,
                  keyboardType: TextInputType.text,
                  onChange: Validator.fieldEmpty,
                  onTap: () {
                    return model.OntapFunction(context);
                  },
                  icon: Icon(
                    RealState.calendar_date,
                    size: 14.h,
                    color: AppColors.primaryColor,
                  ),
                  validator: (val) {
                    return Validator.fieldEmpty(model.dateField.text);
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                termsAndConditionView(model),
                model.onSignUpButtonTap
                    ? model.onTap
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.only(top: 15.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Please select the above option.",
                                  style: TextStyle(
                                    color: AppColors.red,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          )
                    : SizedBox(),
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

Widget termsAndConditionView(registrationModel model) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      InkWell(
          onTap: () {
            model.onTap = !model.onTap;
          },
          child: model.onTap
              ? Container(
                  width: 20.w,
                  height: 20.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.primaryColor),
                  child: Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 10.sp,
                  ),
                )
              : Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 1.w, color: AppColors.lightGrey)),
                )),
      SizedBox(
        width: 10.w,
      ),
      RichText(
        text: TextSpan(
          text: "I accept the ",
          style: AppTheme.lightTheme.textTheme.displaySmall!.copyWith(
            color: AppColors.textFieldHint,
            fontSize: AppSize.size12,
          ),
          children: [
            TextSpan(
              text: "Terms ",
              recognizer: TapGestureRecognizer()
                ..onTap = () => model.redirectToTermPage(),
              style: AppTheme.lightTheme.textTheme.displaySmall!.copyWith(
                color: AppColors.primaryColor,
                fontSize: AppSize.size12,
              ),
            ),
            TextSpan(
              text: "and ",
            ),
            TextSpan(
              text: "Privacy Policy",
              recognizer: TapGestureRecognizer()
                ..onTap = () => model.redirectToPolicyPage(),
              style: AppTheme.lightTheme.textTheme.displaySmall!.copyWith(
                color: AppColors.primaryColor,
                fontSize: AppSize.size12,
              ),
            ),
          ],
        ),
      )
    ],
  );
}
