import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/helper_widget/Image_widgets.dart';
import 'package:realstate/helper_widget/Text_widgets.dart';
import 'package:realstate/helper_widget/button_widgets.dart';
import 'package:realstate/helper_widget/pinput.dart';
import 'package:realstate/ui/user_module/verify_number_module/verification_model.dart';
import 'package:realstate/utils/app_colors.dart';
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
    ])));
  }

  verificationForm(VerificationModel model) {
    return Form(
       autovalidateMode: AutovalidateMode.onUserInteraction,
        key: model.globalKey,
        child: Padding(
            padding: EdgeInsets.fromLTRB(16.sp, 16.sp, 16.sp, 0),
            child: Column(
              children: [
                pinputOTPField(context, model.pinController, model.focusNode, Constants.verifyError, 
                    model.forceErrorState),
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
                      model.verificationButtonPressed();
                    }),
                    SizedBox(
                  height: 15.h,
                ),
                
              ],
            )));
  }
}
