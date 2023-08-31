import 'dart:async';

import 'package:flutter/material.dart';
import 'package:realstate/services/api.dart';
import 'package:realstate/services/models/otp_verify_resp_model.dart';
import 'package:realstate/services/models/user_model.dart';
import 'package:realstate/utils/app_util.dart';
import 'package:realstate/utils/constant.dart';

class VerificationModel extends ChangeNotifier {
  VerificationModel({
    required BuildContext context,
  }) {}
  final GlobalKey<FormState> verificationGlobalKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final Api _api = Api();
  bool forceErrorState = false;
  String errorMsg = '';
  Timer? _timer;

  bool _showLoader = false;
  bool get showLoader => _showLoader;
  set showLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

  var _mobile;
  get mobile => _mobile;
  set mobile(var value) {
    _mobile = value;
    notifyListeners();
  }

  int _start = 60;
  int get start => _start;
  set start(int value) {
    _start = value;
    notifyListeners();
  }

  Data? _userData;
  Data? get userData => _userData;
  set userData(Data? value) {
    _userData = value;
    notifyListeners();
  }

  verificationButtonPressed() {
    if (pinController.text.isEmpty || pinController.text.length != 4) {
      forceErrorState = true;
      notifyListeners();
    } else if (verificationGlobalKey.currentState!.validate()) {
      forceErrorState = false;
      notifyListeners();
      _timer?.cancel();
      callValidateOtpApi();
    }
  }

  Future<void> callValidateOtpApi() async {
    showLoader = true;
    var map = Map<String, dynamic>();
    map['mobile'] = mobile;
    map['otp'] = pinController.text;

    OtpVerifyResp otpVerifyResp = await _api.otpVerifyApi(map);

    switch (otpVerifyResp.status) {
      case Constants.sucessCode:
        if (otpVerifyResp.message != null &&
            otpVerifyResp.message!.isNotEmpty) {
          if (otpVerifyResp.data != null && otpVerifyResp.data != '') {
             User user =
            User(mobile:  mobile,);
            Navigator.pushNamed(AppUtil.getContext(), "/registration_screen",
             arguments: user);
          }
        
        }

        break;
      case Constants.wrongError:
        AppUtil.showDialogbox(AppUtil.getContext(),
            otpVerifyResp.error ?? 'Oops Something went wrong');

        break;

      case Constants.networkErroCode:
        AppUtil.showDialogbox(AppUtil.getContext(),
            otpVerifyResp.error ?? 'Oops Something went wrong');

        break;
      default:
        {
          if (otpVerifyResp.error != null && otpVerifyResp.error!.isNotEmpty) {
            AppUtil.showDialogbox(AppUtil.getContext(),
                otpVerifyResp.error ?? 'Oops Something went wrong');
          }
        }
        break;
    }

    showLoader = false;
  }

  resendCode() {
    start = 60;
    startTimer();
  }

  void startTimer() {
    start = 60;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();

          // Cancel the timer
        } else {
          start--;
          print(start);
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
