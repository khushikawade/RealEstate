import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/helper_widget/Image_widgets.dart';
import 'package:realstate/helper_widget/button_widgets.dart';
import 'package:realstate/helper_widget/text_widgets.dart';
import 'package:realstate/helper_widget/pinput.dart';
import 'package:realstate/services/models/user_model.dart';
import 'package:realstate/ui/user_module/verify_number_module/verification_model.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_size.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/constant.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final otpVerifyModel =
          Provider.of<VerificationModel>(context, listen: false);
      final User? message = ModalRoute.of(context)?.settings.arguments as User?;
      print(message!.mobile);
      print(message.otp);
      if (message != null) {
        otpVerifyModel.pinController.text = message.otp.toString();
        otpVerifyModel.mobile = message.mobile;
      }
      otpVerifyModel.startTimer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<VerificationModel>(context);
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      SizedBox(
        height: 60.h,
      ),
      headingTextWidget(Constants.otpVerification, context),
      SizedBox(
        height: 20.h,
      ),
      // subheadingTextWidget(Constants.loginSubheading, context),
      // SizedBox(
      //   height: 20.h,
      // ),
      headingImage(Constants.verifyImage),
      SizedBox(
        height: 20.h,
      ),
      verificationForm(model),
      SizedBox(
        height: 20.h,
      ),
    ])));
  }

  verificationForm(VerificationModel model) {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: model.verificationGlobalKey,
        child: Padding(
            padding: EdgeInsets.fromLTRB(16.sp, 16.sp, 16.sp, 0),
            child: Column(
              children: [
                pinputOTPField(context, model.pinController, model.focusNode,
                    Constants.verifyError, model.forceErrorState),
                SizedBox(
                  height: 25.h,
                ),

                //----------------Timer---------------------//
                RichText(
                    text: TextSpan(
                        style: AppTheme.lightTheme.textTheme.displaySmall!
                            .copyWith(
                          fontSize: AppSize.size12,
                        ),
                        children: <TextSpan>[
                      const TextSpan(
                          text: Constants.codeExpiresIn,
                          style: TextStyle(
                            color: AppColors.codeExpire,
                            fontWeight: FontWeight.w400,
                          )),
                      const TextSpan(
                          text: "00:",
                          style: TextStyle(
                            color: AppColors.timer,
                            fontWeight: FontWeight.w500,
                          )),
                      TextSpan(
                          text: model.start.toString(),
                          style: const TextStyle(
                            color: AppColors.timer,
                            fontWeight: FontWeight.w500,
                          )),
                    ])),
                SizedBox(
                  height: 10.h,
                ),

                //----------------resend code---------------------//
                RichText(
                    text: TextSpan(
                        style: AppTheme.lightTheme.textTheme.displaySmall!
                            .copyWith(
                          fontSize: AppSize.size12,
                        ),
                        children: <TextSpan>[
                      const TextSpan(
                          text: Constants.didNotReceive,
                          style: TextStyle(
                            color: AppColors.codeExpire,
                            fontWeight: FontWeight.w400,
                          )),
                      TextSpan(
                          text: Constants.resend,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => model.resendCode(),
                          style: TextStyle(
                            color: model.start == 0
                                ? AppColors.timer
                                : AppColors.codeExpire,
                            fontWeight: FontWeight.w500,
                          )),
                    ])),
                SizedBox(
                  height: 25.h,
                ),
                ButtonWidget(
                    bordercolor: AppColors.buttonColor,
                    isLoading: model.showLoader,
                    textcolor: AppColors.white,
                    title: Constants.verifyButton,
                    backgroundcolorname: AppColors.buttonColor,
                    callBack: () {
                      model.verificationButtonPressed();
                    }),
                SizedBox(
                  height: 15.h,
                ),
              ],
            )));
  }
}
