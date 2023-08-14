import 'package:flutter/material.dart';
import 'package:realstate/utils/app_util.dart';

class VerificationModel extends ChangeNotifier {
  VerificationModel({
    required BuildContext context,
  }) {}
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool forceErrorState = false;
  String errorMsg = '';

  bool _showLoader = false;
  bool get showLoader => _showLoader;
  set showLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

  verificationButtonPressed() {
    if (pinController.text == null ||
        pinController.text.isEmpty ||
        pinController.text.length != 4) {
      forceErrorState = true;
      // errorMsg = true;
      notifyListeners();
    } else if (globalKey.currentState!.validate()) {
      forceErrorState = false;
      // errorMsg = false;
      notifyListeners();
       Navigator.popAndPushNamed(AppUtil.getContext(), "/success_screen");
    }
  }
}
