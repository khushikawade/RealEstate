import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:realstate/utils/app_colors.dart';

final defaultPinTheme = PinTheme(
    width: 65,
    height: 68,
    textStyle: const TextStyle(
      fontSize: 27,
      color: Color(0xff545454),
    ),
    decoration: BoxDecoration(
      border: Border(
          bottom: BorderSide(
        color: AppColors.pinColor,
        width: 1.h,
      )),
    ));

Widget pinputOTPField(
    BuildContext context,
    TextEditingController controllername,
    FocusNode focusNode,
    String? errorText,
    bool forceErrorState) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: Pinput(
      autofocus: true,
      enableSuggestions: false,

      // obscureText: true,
      controller: controllername,
      focusNode: focusNode,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],

      errorText: errorText ?? "Error",

      errorTextStyle: TextStyle(fontSize: 11.sp, color: AppColors.errorColor),
      // pinputAutovalidateMode:
      //     PinputAutovalidateMode.,

      forceErrorState: forceErrorState,
      // showCursor:true,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      listenForMultipleSmsOnAndroid: true,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => const SizedBox(width: 22),
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onChanged: (value) {
        debugPrint('onChanged: $value');
      },

      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: const Border(
              bottom: BorderSide(
            color: AppColors.primaryColor,
          )),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: const Border(
              bottom: BorderSide(
            color: AppColors.primaryColor,
          )),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: const Border(
            bottom: BorderSide(
          color: AppColors.errorColor,
        )),
      ),
    ),
  );
}
