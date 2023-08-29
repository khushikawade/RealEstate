import 'dart:async';

import 'package:flutter/material.dart';
import 'package:realstate/utils/app_util.dart';

class VerificationModel extends ChangeNotifier {
  VerificationModel({
    required BuildContext context,
  }) {}
  final GlobalKey<FormState> verificationGlobalKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool forceErrorState = false;
  String errorMsg = '';
  Timer? _timer;

  bool _showLoader = false;
  bool get showLoader => _showLoader;
  set showLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

  int _start = 60;
  int get start => _start;
  set start(int value) {
    _start = value;
    notifyListeners();
  }

  verificationButtonPressed() {
    if (pinController.text.isEmpty ||
        pinController.text.length != 4) {
      forceErrorState = true;
      // errorMsg = true;
      notifyListeners();
    } else if (verificationGlobalKey.currentState!.validate()) {
      forceErrorState = false;
      // errorMsg = false;
      notifyListeners();
      _timer?.cancel();
      Navigator.pushNamed(AppUtil.getContext(), "/registration_screen");
    }
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
